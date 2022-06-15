//
//  HttpClient.swift
//  Weather_Forecast
//
//  Created by 신의연 on 2022/06/14.
//

import Foundation

class HttpClient {
    private let baseUrl: String
    private let headerDic: [String: String] = ["appCode": "TMP_iOS"]
    let origin = "q=Seoul&appid=18ef8f79c4e487640ba6b05aa9ca0a4f"
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }

    
    func getJson(params: [String: Any], completed: @escaping (Result<Data, Error>) -> Void) {
        
        DispatchQueue.global(qos: .background).async {
            let queryParams = params.map { k, v in "\(k)=\(v)" }.joined(separator: "&")

            var fullPath = self.baseUrl
            if !queryParams.isEmpty {
                fullPath += "?" + queryParams
            }
            do {
                let url = URL(string: fullPath)
                let data = try Data(contentsOf: url!)
                DispatchQueue.main.async {
                    completed(Result.success(data))
                }
            } catch {
                DispatchQueue.main.async {
                    completed(Result.failure(error))
                }
            }
        }
    }
}
