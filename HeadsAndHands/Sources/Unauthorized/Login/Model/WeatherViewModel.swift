//
//  WeatherViewModel.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/25/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import Foundation

struct WeatherViewModel {
    private var model: WeatherResponseModel
    
    init(with model: WeatherResponseModel) {
        self.model = model
    }
}

extension WeatherViewModel {
    var message: String {
        let weatherType = model.weather.count != 0 ? model.weather[0].main : "Unknown"
        return "Weather in \(model.name) is \(weatherType)"
    }
}
