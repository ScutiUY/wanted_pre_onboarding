//
//  WeatherListViewController.swift
//  Weather_Forecast
//
//  Created by 신의연 on 2022/06/13.
//

import UIKit

class WeatherListViewController: UIViewController {

    var viewModel: WeatherListViewModel!
    
    var transition = TransitionController()
    
    lazy var activity: UIActivityIndicatorView = {
        var activity = UIActivityIndicatorView(style: .large)
        return activity
    }()
    
    lazy var weatherCollectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(WeatherListCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.dragDelegate = self
        collectionView.dropDelegate = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = WeatherListViewModel()
        setLayout()
        setVM()
    }

    func setLayout() {
        
        self.title = "Weather"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        weatherCollectionView.translatesAutoresizingMaskIntoConstraints = false
        activity.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(weatherCollectionView)
        view.addSubview(activity)
        
        NSLayoutConstraint.activate([
            weatherCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            weatherCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            weatherCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            activity.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activity.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func setVM() {
        viewModel.weatherListUpdated = { [weak self] in
            self?.weatherCollectionView.reloadData()
            self?.weatherCollectionView.refreshControl?.endRefreshing()
        }
        viewModel.loadingStarted = { [weak self] in
            self?.activity.startAnimating()
        }
        viewModel.loadingEnded = { [weak self] in
            self?.activity.stopAnimating()
        }
        viewModel.getList()
    }
    
}

//MARK: - CollectionView Delegate
extension WeatherListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.listCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = weatherCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! WeatherListCollectionViewCell
        let weatherData = viewModel.weather(index: indexPath.row)
        cell.setLayout()
        cell.fetchWeatherData(data: weatherData)
        cell.backgroundColor = GlobalConstants.Color.Background.day
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let weatherDetailVC = WeatherDetailViewController()
        weatherDetailVC.view.backgroundColor = GlobalConstants.Color.Background.day
        let weatherData = viewModel.weather(index: indexPath.row)
        weatherDetailVC.viewModel.getWeatherData(weatherData: weatherData)
        
        weatherDetailVC.modalPresentationStyle = .fullScreen
        weatherDetailVC.modalPresentationCapturesStatusBarAppearance = true
        
        self.present(weatherDetailVC, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width * 0.9, height: 150)
    }
    
}

//MARK: - Drag and Drop Delegate
extension WeatherListViewController: UICollectionViewDragDelegate, UICollectionViewDropDelegate {
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let item = viewModel.weather(index: indexPath.row)
        let itemProvider = NSItemProvider(object: item)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = item
        return [dragItem]
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        if let destinationIndexPath = coordinator.destinationIndexPath {
            if let item = coordinator.items.first, let sourceIndexPath = item.sourceIndexPath {
                collectionView.performBatchUpdates {
                    viewModel.remove(at: sourceIndexPath.item)
                    viewModel.insert(item.dragItem.localObject as! WeatherInfo, at: destinationIndexPath.item)

                    collectionView.deleteItems(at: [sourceIndexPath])
                    collectionView.insertItems(at: [destinationIndexPath])
                }
                coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, canHandle session: UIDropSession) -> Bool {
        return true
    }
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        guard collectionView.hasActiveDrag else { return UICollectionViewDropProposal(operation: .forbidden) }
        return UICollectionViewDropProposal(operation: .move)
    }
    
    
}
