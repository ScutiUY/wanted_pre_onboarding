//
//  WeatherDetailViewController.swift
//  Weather_Forecast
//
//  Created by 신의연 on 2022/06/14.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    var viewModel: WeatherDetailViewModel!
    
    lazy var topStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var weatherImage: UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    
    lazy var cityNameLabel: UILabel = {
        var label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.numberOfLines = 1
        label.text = "서울"
        label.textColor = .white
        label.minimumScaleFactor = 1
        return label
    }()
    
    lazy var temperatureLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.text = "22°C"
        label.textColor = .white
        label.minimumScaleFactor = 1
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.text = "description"
        label.textColor = .white
        label.minimumScaleFactor = 1
        return label
    }()
    
    lazy var closeButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "closeB"), for: .normal)
        return button
    }()
    
    lazy var detailWeatherInfoCollectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(DetailWeatherInfoCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = WeatherDetailViewModel()
        setLayout()
        setVM()
    }
    
    func setLayout() {
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        detailWeatherInfoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        closeButton.addTarget(self, action: #selector(closeDetailWeather), for: .touchUpInside)
        
        view.addSubview(weatherImage)
        
        view.addSubview(topStackView)
        topStackView.addArrangedSubview(cityNameLabel)
        topStackView.addArrangedSubview(temperatureLabel)
        topStackView.addArrangedSubview(descriptionLabel)
        
        view.addSubview(closeButton)
        view.addSubview(detailWeatherInfoCollectionView)
        
        NSLayoutConstraint.activate([
            
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            
            weatherImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            weatherImage.widthAnchor.constraint(equalToConstant: 100),
            weatherImage.heightAnchor.constraint(equalToConstant: 100),
            
            topStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topStackView.topAnchor.constraint(equalTo: weatherImage.bottomAnchor, constant: 10),
            topStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
        
            detailWeatherInfoCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailWeatherInfoCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor).constraintWithMultiplier(0.9),
            detailWeatherInfoCollectionView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 50),
            detailWeatherInfoCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
    func setVM() {
        viewModel.dataUpdate = { [weak self] in
            let weatherData = self?.viewModel.fetchData()
            ImageLoader.loadImage(icon: (weatherData?.weather.first!.icon)!) { image in
                self?.weatherImage.image = image
            }
            self?.cityNameLabel.text = weatherData?.name
            self?.temperatureLabel.text = String(Int(ceil((weatherData?.main.temp)! - 273.15))) + "°C"
            self?.descriptionLabel.text = weatherData?.weather.first!.description
            self?.detailWeatherInfoCollectionView.reloadData()
        }
        
    }
    
    @objc func closeDetailWeather() {
        print("pressed")
        self.dismiss(animated: true)
    }

}

extension WeatherDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("return cell num")
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = detailWeatherInfoCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DetailWeatherInfoCollectionViewCell
        cell.setLayout()
        cell.fetchData(index: indexPath.row, weatherData: viewModel.fetchData())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2.5, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}
