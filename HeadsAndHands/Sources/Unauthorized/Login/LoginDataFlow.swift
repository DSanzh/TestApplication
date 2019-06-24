//
//  LoginDataFlow.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/9/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import Foundation

protocol LoginStateProtocol {
    var state: LoginViewController.State { get set }
}

enum LoginDataFlow {
    enum Authorize {
        struct Request {
            var request: AuthorizeRequest
        }
        struct Response {
            var response: AuthorizeResponse
        }
        struct ViewModel {
            var viewModel: LoginViewController.State
        }
    }
}

extension LoginDataFlow {
    enum AuthorizeRequest {
        case login(with: AuthorizeLoginViewModel)
    }
    enum AuthorizeResponse {
        case failure(Error)
        case success
    }
}
