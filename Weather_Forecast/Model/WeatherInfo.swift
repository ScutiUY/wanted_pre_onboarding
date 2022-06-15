//
//  Weather.swift
//  Weather_Forecast
//
//  Created by 신의연 on 2022/06/14.
//

import Foundation


struct weatherInfo: Codable {
    
    static var EMPTY = WeatherData(coord: [], weather: [], main: [])
    
    var coord: [Coordinate] = []
    var weather: [Weather] = []
    var main: [WeatherInfo] = []
    
    
    init(coord: [Coordinate], weather: [Weather], main: [WeatherInfo]) {
        self.coord = coord
        self.weather = weather
        self.main = main
        
    }
   
    enum CodeKeys: CodingKey {
        case coord
        case weather
        case main
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodeKeys.self)
        coord = try container.decode ([Coordinate].self, forKey: .coord)
        weather = try container.decode ([Weather].self, forKey: .weather)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodeKeys.self)
        try container.encode(coord, forKey: .coord)
        try container.encode(weather, forKey: .weather)
        try container.encode(main, forKey: .main)
    }
}
