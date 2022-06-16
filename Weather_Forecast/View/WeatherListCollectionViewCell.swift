//
//  WeatherListCollectionViewCell.swift
//  Weather_Forecast
//
//  Created by 신의연 on 2022/06/14.
//

import UIKit

class WeatherListCollectionViewCell: UICollectionViewCell {
    
    lazy var cityNTempLabelStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var weatherImage: UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    
    lazy var cityNameLabel: UILabel = {
        var label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.numberOfLines = 1
        label.text = "서울"
        label.textColor = .white
        label.minimumScaleFactor = 1
        return label
    }()
    
    lazy var temperatureLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.text = "22°C"
        label.textColor = .white
        label.minimumScaleFactor = 1
        return label
    }()
    
    lazy var additionalInfoAnchorView: UIView = {
        var view = UIView()
        return view
    }()
    
    lazy var humidityLabel: UILabel = {
        var label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
    
    lazy var maxTempLabel: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var minTempLabel: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.weatherImage.image = nil
    }
    
    func setLayout() {
        
        self.layer.cornerRadius = self.frame.width/50
        
        cityNTempLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        maxTempLabel.translatesAutoresizingMaskIntoConstraints = false
        minTempLabel.translatesAutoresizingMaskIntoConstraints = false
        additionalInfoAnchorView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(cityNTempLabelStackView)
        
        cityNTempLabelStackView.addArrangedSubview(cityNameLabel)
        cityNTempLabelStackView.addArrangedSubview(temperatureLabel)
        
        self.addSubview(weatherImage)
        
        self.addSubview(additionalInfoAnchorView)
        self.addSubview(humidityLabel)
        self.addSubview(maxTempLabel)
        self.addSubview(minTempLabel)
        
        NSLayoutConstraint.activate([
        
            cityNTempLabelStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            cityNTempLabelStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9),
            cityNTempLabelStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            cityNTempLabelStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            cityNameLabel.widthAnchor.constraint(equalTo: cityNTempLabelStackView.widthAnchor),
            temperatureLabel.widthAnchor.constraint(equalTo: cityNTempLabelStackView.widthAnchor),
        
            weatherImage.topAnchor.constraint(equalTo: self.topAnchor),
            weatherImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            weatherImage.bottomAnchor.constraint(equalTo: self.centerYAnchor),
            weatherImage.widthAnchor.constraint(equalTo: weatherImage.heightAnchor),
            
            additionalInfoAnchorView.topAnchor.constraint(equalTo: self.centerYAnchor),
            additionalInfoAnchorView.bottomAnchor.constraint(equalTo: temperatureLabel.bottomAnchor),
            additionalInfoAnchorView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            additionalInfoAnchorView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            
            humidityLabel.topAnchor.constraint(equalTo: additionalInfoAnchorView.topAnchor),
            humidityLabel.bottomAnchor.constraint(equalTo: additionalInfoAnchorView.centerYAnchor),
            humidityLabel.trailingAnchor.constraint(equalTo: additionalInfoAnchorView.trailingAnchor),
            
            maxTempLabel.topAnchor.constraint(equalTo: additionalInfoAnchorView.centerYAnchor),
            maxTempLabel.trailingAnchor.constraint(equalTo: additionalInfoAnchorView.trailingAnchor),
            
            minTempLabel.topAnchor.constraint(equalTo: additionalInfoAnchorView.centerYAnchor),
            minTempLabel.trailingAnchor.constraint(equalTo: maxTempLabel.leadingAnchor, constant: -10)
            
        ])
        
    }
    
    func fetchWeatherData(data: WeatherInfo) {
        if data.icon == nil {
            ImageLoader.loadImage(icon: data.weather.first!.icon) { icon in
                self.weatherImage.image = icon
            }
        } else {
            weatherImage.image = data.icon
        }
        
        cityNameLabel.text = data.name
        temperatureLabel.text = String(Int(ceil(data.main.temp - 273.15))) + "°C"
        humidityLabel.text = "humidity: " + String(data.main.humidity)
        maxTempLabel.text = "max: " + String(Int(ceil(data.main.temp_max - 273.15))) + "°C"
        minTempLabel.text = "min: " + String(Int(ceil(data.main.temp_min - 273.15))) + "°C"
    }
}
