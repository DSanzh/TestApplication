//
//  LoginService.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/10/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import Foundation
import Moya

protocol LoginServiceProtocol {
    func authorize(with login: String, password: String, completion: @escaping (Result<String, NSError>) -> ())
}

class LoginService: LoginServiceProtocol {
    private let provider = MoyaProvider<WeatherEndpoint>()
    
    init(provider: MoyaProvider<WeatherEndpoint>) {
        self.provider = provider
    }
    
    func authorize(with login: String, password: String, completion: @escaping (Result<String, NSError>) -> ()) {
        let city = "Almaty"
        self.provider.request(.city(name: city)) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

//extension LoginService {
//    private func authorize() {
//        let city = "Almaty"
//        self.provider.request(.city(name: city)) { result in
//            switch result {
//            case .success(let response):
//                print(response)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
//}
