//
//  WeatherListViewModel.swift
//  Weather_Forecast
//
//  Created by 신의연 on 2022/06/14.
//

import Foundation

class WeatherListViewModel: NSObject {
    
    var repository = Repository()
    
    private var weatherList: WeatherData = WeatherData.EMPTY
    
    var loadingStarted: (() -> ()) = { }
    var loadingEnded: (() -> ()) = { }
    var weatherListUpdated: (() -> ()) = { }
    
    func listCount() -> Int {
        return weatherList.weatherList.count
    }
    
    func getList() {
        weatherList.weatherList = []
        loadingStarted()
        for region in weatherList.originRegion {
            repository.list(region: region) { [self] weatherInfo in
                self.weatherList.weatherList.append(weatherInfo)
                self.weatherListUpdated()
            }
        }
    }
    
    func weather(index: Int) -> WeatherInfo {
        return weatherList.weatherList[index]
    }
}
