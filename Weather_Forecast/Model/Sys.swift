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
    
    enum Codingkeys: CodingKey {
        case type
        case id
        case country
        case sunrise
        case sunset
    }
    
    init(type: Int, id: Int, country: String, sunrise: Int, sunset: Int) {
        self.type = type
        self.id = id
        self.country = country
        self.sunrise = sunrise
        self.sunset = sunset
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: Codingkeys.self)
        type = (try? container.decode(Int.self, forKey: .type)) ?? 0
        id = (try? container.decode(Int.self, forKey: .type)) ?? 0
        country = (try? container.decode(String.self, forKey: .type)) ?? ""
        sunrise = (try? container.decode(Int.self, forKey: .type)) ?? 0
        sunset = (try? container.decode(Int.self, forKey: .type)) ?? 0
        
    }
    
}
