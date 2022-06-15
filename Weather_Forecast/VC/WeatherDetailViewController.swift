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
    
    lazy var feel_Temp: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.text = "Feels like 22°C"
        label.textColor = .white
        label.minimumScaleFactor = 1
        return label
    }()
    
    lazy var humidityLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.text = "습도: 0%"
        label.textColor = .white
        label.minimumScaleFactor = 1
        return label
    }()
    
    lazy var tempStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var maxTempLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.text = "max: 20°C"
        label.textColor = .white
        label.minimumScaleFactor = 1
        return label
    }()
    
    lazy var minTempLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.text = "min: 20°C"
        label.textColor = .white
        label.minimumScaleFactor = 1
        return label
    }()
    
    lazy var pressureLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.text = "기압 hPa"
        label.textColor = .white
        label.minimumScaleFactor = 1
        return label
    }()
    
    lazy var windLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.text = "풍속: 1.03m/s"
        label.textColor = .white
        label.minimumScaleFactor = 1
        return label
    }()
    
    lazy var visibility: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.text = "가시거리: 10km"
        label.textColor = .white
        label.minimumScaleFactor = 1
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = WeatherDetailViewModel()
        setLayout()
        setVM()
    }
    
    func setLayout() {
        
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        feel_Temp.translatesAutoresizingMaskIntoConstraints = false
        
        tempStackView.translatesAutoresizingMaskIntoConstraints = false
        maxTempLabel.translatesAutoresizingMaskIntoConstraints = false
        minTempLabel.translatesAutoresizingMaskIntoConstraints = false
        
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        pressureLabel.translatesAutoresizingMaskIntoConstraints = false
        windLabel.translatesAutoresizingMaskIntoConstraints = false
        visibility.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(topStackView)
        topStackView.addArrangedSubview(weatherImage)
        topStackView.addArrangedSubview(cityNameLabel)
        topStackView.addArrangedSubview(temperatureLabel)
        topStackView.addArrangedSubview(descriptionLabel)
        topStackView.addArrangedSubview(feel_Temp)
        
        view.addSubview(tempStackView)
        tempStackView.addArrangedSubview(maxTempLabel)
        tempStackView.addArrangedSubview(minTempLabel)
        
        topStackView.addArrangedSubview(tempStackView)
        
        view.addSubview(humidityLabel)
        view.addSubview(pressureLabel)
        view.addSubview(windLabel)
        view.addSubview(visibility)
        
        NSLayoutConstraint.activate([
            
            topStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            topStackView.bottomAnchor.constraint(equalTo: view.centerYAnchor).constraintWithMultiplier(0.7),
            topStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            weatherImage.widthAnchor.constraint(equalToConstant: 100),
            weatherImage.heightAnchor.constraint(equalToConstant: 100),
            
            humidityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            humidityLabel.topAnchor.constraint(equalTo: topStackView.bottomAnchor),
            
            pressureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pressureLabel.topAnchor.constraint(equalTo: humidityLabel.bottomAnchor),
            
            windLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            windLabel.topAnchor.constraint(equalTo: pressureLabel.bottomAnchor),
            
            visibility.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            visibility.topAnchor.constraint(equalTo: windLabel.bottomAnchor),
            
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
            self?.feel_Temp.text = "feels like: " + String(Int(ceil((weatherData?.main.feels_like)! - 273.15))) + "°C"
            self?.maxTempLabel.text = "max: " + String(Int(ceil((weatherData?.main.temp_max)! - 273.15))) + "°C"
            self?.minTempLabel.text = "max: " + String(Int(ceil((weatherData?.main.temp_min)! - 273.15))) + "°C"
            self?.humidityLabel.text = "humidity: " + String((weatherData?.main.humidity)!) + "%"
            self?.pressureLabel.text = "pressure: " + String((weatherData?.main.pressure)!) + "hPa"
            self?.windLabel.text = "wind speed: " + String((weatherData?.wind.speed)!) + "m/s"
            self?.visibility.text = "visibility: " + String(weatherData!.visibility) + "km"
        }
        
    }

}
