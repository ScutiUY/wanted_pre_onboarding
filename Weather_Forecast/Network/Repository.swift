//
//  Repository.swift
//  Weather_Forecast
//
//  Created by 신의연 on 2022/06/14.
//

import Foundation

class Repository: NSObject {
    var count = 0
    private let httpClient = HttpClient(baseUrl: "https://api.openweathermap.org/data/2.5/weather")
    private let serviceKey = "18ef8f79c4e487640ba6b05aa9ca0a4f"
    private let baseRegion = "Korea"
    
    func list(region: String, completed: @escaping (WeatherInfo) -> Void) {
        httpClient.getJson(params: ["q" : region, "appid":serviceKey]) { result in
            
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(WeatherInfo.self, from: data)
                    if self.count == WeatherData.EMPTY.originRegion.count - 1 {
                        completed(decodedData)
                    } else {
                        ImageLoader.loadImage(icon: decodedData.weather.first!.icon) { image in
                            decodedData.icon = image
                        }
                        WeatherData.EMPTY.weatherList.append(decodedData)
                        self.count+=1
                    }
                    
                } catch {
                    print("getWeatherData Decoidng error in \(#function)")
                }
                
            case .failure(let error):
                print("error:",error)
            }
        }
    }
}
