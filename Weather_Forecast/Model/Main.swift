//
//  WeatherInfo.swift
//  Weather_Forecast
//
//  Created by 신의연 on 2022/06/14.
//

import Foundation

struct Main: Codable {
    
    // 현재기온, 체감기온, 현재습도, 최저, 최고 기온, 기압.
    
    static var empty = Main(temp: 0, feels_like: 0, temp_min: 0, temp_max: 0, pressure: 0, humidity: 0)
    
    let temp: Float
    let feels_like: Float
    let temp_min: Float
    let temp_max: Float
    let pressure: Float
    let humidity: Int
}
