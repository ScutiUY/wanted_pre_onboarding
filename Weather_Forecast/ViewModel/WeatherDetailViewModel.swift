//
//  WeatherDetailViewModel.swift
//  Weather_Forecast
//
//  Created by 신의연 on 2022/06/15.
//

import Foundation

class WeatherDetailViewModel {
    
    private var weatherDetailData = WeatherInfo(coord: Coordinate.empty, weather: [], main: Main.empty)
    
    var dataUpdate: (() -> ()) = { }
    
    func fetchData() -> WeatherInfo{
        return weatherDetailData
    }
    
    func getWeatherData(weatherData: WeatherInfo) {
        weatherDetailData = weatherData
        self.dataUpdate()
    }
    
}
