//
//  WeatherListViewController.swift
//  Weather_Forecast
//
//  Created by 신의연 on 2022/06/13.
//

import UIKit

class WeatherListViewController: UIViewController {

    var viewModel: WeatherListViewModel!
    
    lazy var weatherCollectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(WeatherListCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
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
        
        view.addSubview(weatherCollectionView)
        
        NSLayoutConstraint.activate([
            weatherCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            weatherCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            weatherCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setVM() {
        viewModel.weatherListUpdated = { [weak self] in
            self?.weatherCollectionView.reloadData()
            self?.weatherCollectionView.refreshControl?.endRefreshing()
        }
        viewModel.getList()
    }
    
}

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
        
        self.present(weatherDetailVC, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width * 0.9, height: 150)
    }
    
}

