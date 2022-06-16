//
//  Weather.swift
//  Weather_Forecast
//
//  Created by 신의연 on 2022/06/14.
//

import Foundation

struct Weather: Codable {
    static var empty = Weather(id: 0, main: "", description: "", icon: "")
    let id: Int
    let main: String
    let description: String
    let icon: String
    
    init(id: Int, main: String, description: String, icon: String) {
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
    }
    
    enum Codingkeys: CodingKey {
        case id
        case main
        case description
        case icon
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: Codingkeys.self)
        id = (try? container.decode(Int.self, forKey: .id)) ?? 0
        main = (try? container.decode(String.self, forKey: .main)) ?? ""
        description = (try? container.decode(String.self, forKey: .description)) ?? ""
        icon = (try? container.decode(String.self, forKey: .icon)) ?? ""
        
    }
    
}
