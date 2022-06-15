//
//  Weather.swift
//  Weather_Forecast
//
//  Created by 신의연 on 2022/06/14.
//

import Foundation
import UIKit


struct WeatherInfo: Codable {
    
    // 도시이름, 날씨 아이콘, 현재기온, 체감기온
    
    var coord: Coordinate = Coordinate.empty
    var weather: [Weather] = []
    var base: String = ""
    var main: Main = Main.empty
    var visibility: Int = 0
    var wind: Wind = Wind(speed: 0, deg: 0)
    var timezone: Int = 0
    var id: Int = 0
    var name: String = ""
    var cod: Int = 0
    var sys: Sys = Sys(type: 0, id: 0, country: "", sunrise: 0, sunset: 0)
    
    init(coord: Coordinate, weather: [Weather], main: Main) {
        self.coord = coord
        self.weather = weather
        self.main = main
    }
   
    enum CodeKeys: CodingKey {
        case coord
        case weather
        case base
        case main
        case visibility
        case timezone
        case id
        case wind
        case name
        case cod
        case sys
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodeKeys.self)
        coord = try container.decode (Coordinate.self, forKey: .coord)
        weather = try container.decode ([Weather].self, forKey: .weather)
        base = try container.decode(String.self, forKey: .base)
        main = try container.decode(Main.self, forKey: .main)
        name = try container.decode(String.self, forKey: .name)
        wind = try container.decode(Wind.self, forKey: .wind)
        sys = try container.decode(Sys.self, forKey: .sys)
        visibility = try container.decode(Int.self, forKey: .visibility)
        
    }
    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodeKeys.self)
//        try container.encode(coord, forKey: .coord)
//        try container.encode(weather, forKey: .weather)
//        try container.encode(main, forKey: .main)
//    }
}
