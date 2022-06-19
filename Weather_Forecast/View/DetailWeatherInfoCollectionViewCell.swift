//
//  DetailWeatherInfoCollectionViewCell.swift
//  Weather_Forecast
//
//  Created by 신의연 on 2022/06/19.
//

import UIKit

class DetailWeatherInfoCollectionViewCell: UICollectionViewCell {
    
    lazy var blurView: UIView = {
        var view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .black
        view.alpha = 0.1
        return view
    }()
    
    lazy var infoTitleLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.text = "Feels like 22°C"
        label.textColor = .white
        label.alpha = 0.7
        label.minimumScaleFactor = 1
        return label
    }()
    
    lazy var infoLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.text = "Feels like 22°C"
        label.textColor = .white
        label.minimumScaleFactor = 1
        return label
    }()
    
    func setLayout() {
        
        
        self.backgroundColor = .clear
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        infoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(blurView)
        self.addSubview(infoTitleLabel)
        self.addSubview(infoLabel)
        
        NSLayoutConstraint.activate([
            
            blurView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            blurView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            blurView.widthAnchor.constraint(equalTo: self.widthAnchor),
            blurView.heightAnchor.constraint(equalTo: self.heightAnchor),
        
            infoTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            infoTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            
            infoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            infoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            
        ])
        
    }
    
    func fetchData(index: Int, weatherData: WeatherInfo) {
        switch index {
        case 0:
            infoTitleLabel.text = "feels like"
            infoLabel.text = String(Int(ceil((weatherData.main.feels_like) - 273.15))) + "°C"
        case 1:
            infoTitleLabel.text = "max/min"
            infoLabel.text = String(Int(ceil((weatherData.main.temp_max) - 273.15))) + "°C/" + String(Int(ceil((weatherData.main.temp_min) - 273.15))) + "°C"
        case 2:
            infoTitleLabel.text = "humidity"
            infoLabel.text = String((weatherData.main.humidity)) + "%"
        case 3:
            infoTitleLabel.text = "pressure"
            infoLabel.text = String((weatherData.main.pressure)) + "hPa"
        case 4:
            infoTitleLabel.text = "wind speed"
            infoLabel.text = String((weatherData.wind.speed)) + "m/s"
        case 5:
            infoTitleLabel.text = "visibility"
            infoLabel.text = String(weatherData.visibility) + "km"
        default:
            return
        }
        
    }
}
