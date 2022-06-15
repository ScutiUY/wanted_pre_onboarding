//
//  Sys.swift
//  Weather_Forecast
//
//  Created by 신의연 on 2022/06/15.
//

import Foundation

struct Sys: Codable {
    var type: Int
    var id: Int
    var country: String
    var sunrise: Int
    var sunset: Int
}
