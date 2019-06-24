//
//  LoginProvider.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/10/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import Foundation
import Moya

typealias ErrorMessage = String?

enum LoginProviderResponse {
    case success(WeatherModel)
    case failure(ErrorMessage)
}

protocol LoginProviderProtocol {
    func login(with type: LoginView.TextField, text: String, completion: @escaping (LoginProviderResponse) -> ())
}

class LoginProvider: LoginProviderProtocol {
    func login(with type: LoginView.TextField, text: String, completion: @escaping (LoginProviderResponse) -> ()) {
        switch type {
        case .email:
            self.dataStore.email = text
        case .password:
            self.dataStore.password = text
        }
        guard let error = validate(), let email = self.dataStore.email, let password = self.dataStore.password else {
            completion(.failure(error))
            return
        }
        
        service.authorize(with: email, password: password) { result in
            switch result {
                case .success(<#T##Success#>)
            }
        }
    }
    
    
    private let dataStore: LoginDataStore
    private let service: LoginServiceProtocol
    
    init(dataStore: LoginDataStore = LoginDataStore(),
         service: LoginServiceProtocol = LoginService(provider: MoyaProvider<WeatherEndpoint>())) {
        self.dataStore = dataStore
        self.service = service
    }
}
extension LoginProvider {
    private func validate() -> ErrorMessage {
        if let email = dataStore.email, email.isEmpty {
            return "Почта не должна быть пустой"
        }
        if let password = dataStore.password, password.isEmpty {
            return "Пароль не должен быть пустым"
        }
        
        return nil
    }
}
