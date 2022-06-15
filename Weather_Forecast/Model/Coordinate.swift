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
}
