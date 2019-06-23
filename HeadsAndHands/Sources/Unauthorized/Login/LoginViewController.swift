//
//  LoginViewController.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/9/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import UIKit

protocol LoginDisplayLogic: class {
    func display(viewModel: LoginDataFlow.Authorize.ViewModel)
}

class LoginViewController: UIViewController {

    private lazy var contentView = self.view as? LoginView
    private var interactor: LoginInteractor
    private var state: State {
        didSet {
            updateDisplay()
        }
    }
    
    init(interactor: LoginInteractor, state: State) {
        self.interactor = interactor
        self.state = state
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func loadView() {
        view = LoginView()
    }
}

extension LoginViewController {
    enum State {
        case initial
    }
    private func updateDisplay() {
        switch state {
        case .initial:
            
        }
    }
}
