//
//  WeatherList.swift
//  Weather_Forecast
//
//  Created by 신의연 on 2022/06/14.
//

import Foundation

class WeatherData: Codable {
    
    static var EMPTY = WeatherData(weatherList: [])
    
    var originRegion = ["Gongju", "Gwangju", "Gumi", "Gunsan" ,"Daejeon", "Mokpo", "Busan", "Seosan", "Seoul", "Sokcho", "Suwon", "Suncheon", "Ulsan", "Iksan", "Jeonju", "Jeju", "Cheonan", "Chungju", "Chuncheon"]
    
    var weatherList: [WeatherInfo] = []
    
    init(weatherList: [WeatherInfo]) {
        self.weatherList = weatherList
    }
}
