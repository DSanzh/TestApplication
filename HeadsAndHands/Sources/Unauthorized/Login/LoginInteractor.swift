//
//  LoginInteractor.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/9/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import Foundation

protocol LoginBusinessLogic: class {
    func update(with request: LoginDataFlow.Authorize.Request)
    func login()
}

class LoginInteractor: LoginBusinessLogic {
    
    private var presenter: LoginPresenterLogic
    private var provider: LoginProviderProtocol
    
    init(presenter: LoginPresenterLogic, provider: LoginProvider = LoginProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    func update(with request: LoginDataFlow.Authorize.Request) {
        switch request.request {
        case .login(let type, let text):
            provider.update(with: type, text: text)
        }
    }
    func login() {
        var response: LoginDataFlow.Authorize.Response = .init(response: .failure(NSError.notAnObject))
        provider.login { result in
            switch result {
            case .success(let model):
                response = .init(response: .success(model))
            case .failure(let error):
                response = .init(response: .failure(error))
            }
            self.presenter.present(response: response)
        }
    }
}
