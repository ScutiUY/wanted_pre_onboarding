//
//  Coordinate.swift
//  Weather_Forecast
//
//  Created by 신의연 on 2022/06/14.
//

import Foundation

struct Coordinate: Codable {
    
    static var empty = Coordinate(longitude: 0, latitude: 0)
    
    let lon: Float
    let lat: Float
    
    init(longitude: Float, latitude: Float) {
        self.lon = longitude
        self.lat = latitude
    }
    
    enum Codingkeys: CodingKey {
        case lon
        case lat
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: Codingkeys.self)
        lon = (try? container.decode(Float.self, forKey: .lon)) ?? 0.0
        lat = (try? container.decode(Float.self, forKey: .lat)) ?? 0.0
        
    }
    
}
