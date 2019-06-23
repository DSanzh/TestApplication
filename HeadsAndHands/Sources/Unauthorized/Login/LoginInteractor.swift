//
//  LoginInteractor.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/9/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import Foundation

protocol LoginBusinessLogic: class {
    func login(with request: LoginDataFlow.Authorize.Request)
}

class LoginInteractor: LoginBusinessLogic {
    
    private var presenter: LoginPresenterLogic
    private var provider: LoginProviderProtocol
    
    init(presenter: LoginPresenterLogic, provider: LoginProvider = LoginProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    func login(with request: LoginDataFlow.Authorize.Request) {
        let response: LoginDataFlow.Authorize.Response = .init(response: .failure(NSError()))
        
        self.presenter.present(response: response)
    }
}
