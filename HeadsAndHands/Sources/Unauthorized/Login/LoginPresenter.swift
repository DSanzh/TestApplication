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
        var viewModel: LoginDataFlow.Authorize.ViewModel = .init(viewModel: .initial)
        switch response.response {
        case .failure(let error):
            viewModel = .init(viewModel: .error(error))
        case .success(let model):
            viewModel = .init(viewModel: .succes(WeatherViewModel(with: model)))
        }
        viewController?.display(viewModel: viewModel)
    }
}
