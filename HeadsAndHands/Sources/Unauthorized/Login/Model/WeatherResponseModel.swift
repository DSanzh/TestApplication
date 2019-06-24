//
//  AuthorizeLoginViewModel.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/24/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import Foundation

struct WeatherResponseModel {
    var name: String = ""
    var id: Int = 0
    var coord = CoordinationModel()
    var weather: [WeatherModel] = []
    
    init() { }
    init(json: JSON) {
        if let name = json["name"] as? String {
            self.name = name
        }
        if let id = json["id"] as? Int {
            self.id = id
        }
        if let coordJSON = json["coord"] as? JSON {
            self.coord = CoordinationModel(json: coordJSON)
        }
        if let weatherJSON = json["weather"] as? JSONArray {
            self.weather = WeatherModel.parse(from: weatherJSON)
        }
    }
}

struct WeatherModel {
    var id: Int = 0
    var main: String = ""
    var description: String = ""
    var icon: String = ""
    
    init(json: JSON) {
        if let id = json["id"] as? Int {
            self.id = id
        }
        if let main = json["main"] as? String {
            self.main = main
        }
        if let description = json["description"] as? String {
            self.description = description
        }
        if let icon = json["icon"] as? String {
            self.icon = icon
        }
    }
    
    static func parse(from list: JSONArray) -> [WeatherModel] {
        return list.compactMap { WeatherModel(json: $0) }
    }
}

struct CoordinationModel {
    
    var lon: Double = 0.0
    var lat: Double = 0.0
    
    init() {}
    
    init(json: JSON) {
        if let lon = json["lon"] as? Double {
            self.lon = lon
        }
        if let lat = json["lat"] as? Double {
            self.lat = lat
        }
    }
}

//{
//    "coord": {
//        "lon": 76.95,
//        "lat": 43.24
//    },
//    "weather": [
//    {
//    "id": 802,
//    "main": "Clouds",
//    "description": "scattered clouds",
//    "icon": "03n"
//    }
//    ],
//    "base": "stations",
//    "main": {
//        "temp": 291.15,
//        "pressure": 1015,
//        "humidity": 55,
//        "temp_min": 291.15,
//        "temp_max": 291.15
//    },
//    "visibility": 10000,
//    "wind": {
//        "speed": 2,
//        "deg": 210
//    },
//    "clouds": {
//        "all": 40
//    },
//    "dt": 1561400840,
//    "sys": {
//        "type": 1,
//        "id": 8818,
//        "message": 0.0075,
//        "country": "KZ",
//        "sunrise": 1561417987,
//        "sunset": 1561473370
//    },
//    "timezone": 21600,
//    "id": 1526384,
//    "name": "Almaty",
//    "cod": 200
//}
