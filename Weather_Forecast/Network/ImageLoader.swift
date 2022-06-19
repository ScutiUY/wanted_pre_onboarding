//
//  ImageLoader.swift
//  Weather_Forecast
//
//  Created by 신의연 on 2022/06/15.
//

import Foundation
import UIKit

class ImageLoader {
    
    private static var imageCache = NSCache<NSString, UIImage>()
    
    static func loadImage(icon: String, completed: @escaping (UIImage?) -> Void) {
        let baseUrl = "https://openweathermap.org/img/wn/"
        let fullPath = baseUrl+"\(icon)"+"@2x.png"
        if icon.isEmpty {
            completed(nil)
            return
        }
        let cacheKey = NSString(string: fullPath)
        if let image = imageCache.object(forKey: cacheKey) {
            DispatchQueue.main.async {
                completed(image)
            }
            return
            
        } else {
            
            DispatchQueue.global(qos: .background).async {
                if let data = try? Data(contentsOf: URL(string: fullPath)!) {
                    let image = UIImage(data: data)
                    imageCache.setObject(image!, forKey: fullPath as NSString)
                    DispatchQueue.main.async {
                        completed(image)
                    }
                } else {
                    DispatchQueue.main.async {
                        completed(nil)
                    }
                }
            }
        }
    }
}

