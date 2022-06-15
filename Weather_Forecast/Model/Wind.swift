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
}
