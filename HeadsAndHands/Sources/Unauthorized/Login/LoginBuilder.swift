//
//  LoginBuilder.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/9/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import UIKit

class LoginBuilder: ModuleBuilder {
    
    private var initialState: LoginViewController.State = .initial
    
    func setInitial(state: LoginViewController.State) -> LoginBuilder {
        self.initialState = state
        return self
    }
    
    func build() -> UIViewController {
        let presenter = LoginPresenter()
        let interactor = LoginInteractor(presenter: presenter)
        let viewController = LoginViewController(interactor: interactor, state: initialState)
        presenter.viewController = viewController
        return viewController
    }
}
