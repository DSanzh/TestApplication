//
//  LoginService.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/10/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import Foundation
import Moya

typealias JSON = [String: Any]
typealias JSONArray = [JSON]
protocol LoginServiceProtocol {
    func authorize(with login: String, password: String, completion: @escaping (Result<WeatherResponseModel, NSError>) -> ())
}

class LoginService: LoginServiceProtocol {
    private var provider = MoyaProvider<WeatherEndpoint>()
    
    init(provider: MoyaProvider<WeatherEndpoint>) {
        self.provider = provider
    }
    
    func authorize(with login: String, password: String, completion: @escaping (Result<WeatherResponseModel, NSError>) -> ()) {
        let city = "Almaty"
        self.provider.request(.city(name: city)) { result in
            switch result {
            case .success(let response):
                guard let anyModel = try? JSONSerialization.jsonObject(with: response.data, options: []), let json = anyModel as? JSON else {
                    completion(.failure(NSError()))
                    return }
                let model = WeatherResponseModel(json: json)
                completion(.success(model))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
