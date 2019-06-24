//
//  LoginEndpoint.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/10/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import Moya

enum WeatherEndpoint {
    case city(name: String)
}

extension WeatherEndpoint: TargetType {
    var baseURL: URL { return URL(string: Network.baseURL)! }
    
    var path: String {
        switch self {
        case .city:
            return "weather"
        }
    }
    
    var method: Method {
        switch self {
        case .city:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .city(let name):
            var params: [String: Any] = [:]
            params["q"] = name
            params["appid"] = Network.apiKey
            return .requestCompositeData(bodyData: Data(), urlParameters: params)
        }
    }
    
    var headers: [String : String]? {
        let header: [String: String] = [
            "Accept-Language": "",
            "Accept": "*/*",
            "Content-Type": "application/json"
        ]
        return header
    }
}
