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
    
    init(temp: Float, feels_like: Float, temp_min: Float, temp_max: Float, pressure: Float, humidity: Int) {
        self.temp = temp
        self.feels_like = feels_like
        self.temp_min = temp_min
        self.temp_max = temp_max
        self.pressure = pressure
        self.humidity = humidity
    }
    
    enum Codingkeys: CodingKey {
        case temp
        case feels_like
        case temp_min
        case temp_max
        case pressure
        case humidity
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: Codingkeys.self)
        temp = (try? container.decode(Float.self, forKey: .temp)) ?? 0.0
        feels_like = (try? container.decode(Float.self, forKey: .feels_like)) ?? 0.0
        temp_min = (try? container.decode(Float.self, forKey: .temp_min)) ?? 0.0
        temp_max = (try? container.decode(Float.self, forKey: .temp_max)) ?? 0.0
        pressure = (try? container.decode(Float.self, forKey: .temp)) ?? 0.0
        humidity = (try? container.decode(Int.self, forKey: .humidity)) ?? 0
        
    }
    
}
