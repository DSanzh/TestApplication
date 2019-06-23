//
//  LoginPresenter.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/9/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import Foundation

protocol LoginPresenterLogic: class {
    func present(response: LoginDataFlow.Authorize.Response)
}

class LoginPresenter: LoginPresenterLogic {
    
    var viewController: LoginDisplayLogic?
    
    func present(response: LoginDataFlow.Authorize.Response) {
        let viewModel: LoginDataFlow.Authorize.ViewModel
        
        viewController?.display(viewModel: viewModel)
    }
}
