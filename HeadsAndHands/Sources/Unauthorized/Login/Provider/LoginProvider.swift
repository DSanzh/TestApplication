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
    case success(WeatherResponseModel)
    case failure(ErrorMessage)
}

protocol LoginProviderProtocol {
    func update(with type: LoginView.TextField, text: String)
    func login(completion: @escaping (LoginProviderResponse) -> ())
}

class LoginProvider: LoginProviderProtocol {
    
    private let dataStore: LoginDataStore
    private let service: LoginServiceProtocol
    
    init(dataStore: LoginDataStore = LoginDataStore(),
         service: LoginServiceProtocol = LoginService(provider: MoyaProvider<WeatherEndpoint>())) {
        self.dataStore = dataStore
        self.service = service
    }
    
    func update(with type: LoginView.TextField, text: String) {
        switch type {
        case .email:
            self.dataStore.email = text
        case .password:
            self.dataStore.password = text
        }
    }
    func login(completion: @escaping (LoginProviderResponse) -> ()) {
        let error = validate()
        guard error == nil else {
            completion(.failure(error!))
            return
        }
        let email = self.dataStore.email
        let password = self.dataStore.password
        service.authorize(with: email, password: password) { result in
            switch result {
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error.localizedDescription))
            }
        }
    }
}
extension LoginProvider {
    private func validate() -> ErrorMessage {
        if dataStore.email.isEmpty {
            return "Почта не должна быть пустой"
        }
        if !isValid(email: dataStore.email) {
            return "Праверьте правильность введенной почты"
        }
        if dataStore.password.isEmpty {
            return "Пароль не должен быть пустым"
        }
        if !isValid(password: dataStore.password) {
            return "Пароль должен быть минимум 6 символов, содержать минимум 1 строчную букву, 1 заглавную, и 1 цифру"
        }
        return nil
    }
    func isValid(email: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.count)) != nil
    }
    func isValid(password: String) -> Bool {
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
}
