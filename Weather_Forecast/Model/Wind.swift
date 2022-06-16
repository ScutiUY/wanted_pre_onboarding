//
//  Wind.swift
//  Weather_Forecast
//
//  Created by 신의연 on 2022/06/15.
//

import Foundation

struct Wind: Codable {
    var speed: Float
    var deg: Int
    
    init(speed: Float, deg: Int) {
        self.speed = speed
        self.deg = deg
    }
    
    enum Codingkeys: CodingKey {
        case speed
        case deg
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: Codingkeys.self)
        speed = (try? container.decode(Float.self, forKey: .speed)) ?? 0.0
        deg = (try? container.decode(Int.self, forKey: .deg)) ?? 0
        
    }
    
}
