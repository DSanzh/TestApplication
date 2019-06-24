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

class LoginViewController: KeyboardEventsViewController {

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
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.clearBackButtonText()
        self.setTitle(text: L10n.Login.title)
        subscribeForKeyboardEvents()
    }
    
    override func loadView() {
        view = LoginView(delegate: self)
    }
    override func keyboardWillAppearWithHeight(_ keyboardHeight: CGFloat) {
        contentView?.setKeyboard(isVisible: true)
    }
    override func keyboardWillDisappear() {
        contentView?.setKeyboard(isVisible: false)
    }
}

extension LoginViewController: LoginDisplayLogic {
    func display(viewModel: LoginDataFlow.Authorize.ViewModel) {
        state = viewModel.viewModel
    }
}

extension LoginViewController: LoginViewDelegate {
    func textDidChange(in type: LoginView.TextField, text: String) {
        
    }
    
    func didTapButton(type: LoginView.Button) {
        
    }
}

extension LoginViewController {
    enum State {
        case initial
    }
    private func updateDisplay() {
        switch state {
        case .initial:
            print()
        }
    }
}
