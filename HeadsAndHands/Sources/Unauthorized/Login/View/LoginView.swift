//
//  LoginView.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/10/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    private var appearance = Appearance()
    private var 
    private lazy var emailTextField = FloatingTextField()
    private lazy var passwordTextField = FloatingTextField()
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.Login.forgotPassword, for: .normal)
        button.setFont(with: appearance.forgotButton.font)
        button.setCorner(radius: appearance.forgotButton.cornerRadius)
        button.setBorder(width: appearance.forgotButton.borderWidth, color: .veryLightPinkTwo)
        return button
    }()
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.Login.enter, for: .normal)
        button.setCorner(radius: appearance.loginButton.cornerRadius)
        button.setFont(with: appearance.loginButton.font)
        button.backgroundColor = appearance.loginButton.backgroundColor
        return button
    }()
    private lazy var notExistButton: UIButton = {
        let button = UIButton()
        button.setFont(with: appearance.notExitsButton.font)
        button.setTitleColor(appearance.notExitsButton.textColor, for: .normal)
        button.setTitle(L10n.Login.loginNotExits, for: .normal)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    private func setupView() {
        addSubviews([emailTextField, passwordTextField, forgotPasswordButton, loginButton, notExistButton])
    }
    private func setupConstraints() {
        
    }
}

extension LoginView {
    struct Appearance: Grid {
        let forgotButton = ForgotButton()
        let loginButton = LoginButton()
        let notExitsButton = NotExistedButton()
        
        struct NotExistedButton {
            let font: UIFont = Font.subheadFirst(size: 15).font
            let textColor: UIColor = Color.windowsBlue.color
        }
        struct LoginButton {
            let font: UIFont = FontFamily.SFProText.medium.font(size: 15)
            let cornerRadius: CGFloat = 28.adjusted
            let backgroundColor = Color.tangerine.color
        }
        struct ForgotButton {
            let font: Font = .captionFirst(size: 12)
            let cornerRadius: CGFloat = 4.adjusted
            let borderWidth: CGFloat = 0.5.adjusted
        }
    }
}


