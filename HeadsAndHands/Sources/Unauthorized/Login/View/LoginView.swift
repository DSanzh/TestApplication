//
//  LoginView.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/10/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import UIKit

protocol LoginViewDelegate {
    func textDidChange(in type: LoginView.TextField, text: String)
    func didTapButton(type: LoginView.Button)
}

class LoginView: UIView {
    
    enum TextField: Int {
        case email
        case password
    }
    enum Button {
        case login
        case forgot
        case notExist
    }
    private var delegate: LoginViewDelegate?
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: appearance.scrollScreen)
        scrollView.contentSize = appearance.scrollScreen.size
        return scrollView
    }()
    private var appearance = Appearance()
    private var containerView = UIView()
    private lazy var emailTextField: FloatingTextField = {
        let textField = FloatingTextField()
        textField.placeholder = L10n.Login.email
        textField.delegate = self
        textField.tag = TextField.email.rawValue
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .next
        return textField
    }()
    private lazy var passwordTextField: FloatingTextField = {
        let textField = FloatingTextField()
        textField.placeholder = L10n.Login.password
        textField.delegate = self
        textField.tag = TextField.password.rawValue
        textField.returnKeyType = .join
        return textField
    }()
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.Login.forgotPassword, for: .normal)
        button.setFont(with: appearance.forgotButton.font)
        button.setCorner(radius: appearance.forgotButton.cornerRadius)
        button.setBorder(width: appearance.forgotButton.borderWidth, color: .veryLightPink)
        button.setTitleColor(appearance.forgotButton.textColor, for: .normal)
        button.addTarget(self, action: #selector(forgotPassword), for: .touchUpInside)
        return button
    }()
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.Login.enter, for: .normal)
        button.setCorner(radius: appearance.loginButton.cornerRadius)
        button.setFont(with: appearance.loginButton.font)
        button.backgroundColor = appearance.loginButton.backgroundColor
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return button
    }()
    private lazy var notExistButton: UIButton = {
        let button = UIButton()
        button.setFont(with: appearance.notExitsButton.font)
        button.contentHorizontalAlignment = .center
        button.setTitleColor(appearance.notExitsButton.textColor, for: .normal)
        button.setTitle(L10n.Login.loginNotExits, for: .normal)
        button.addTarget(self, action: #selector(notExistUsername), for: .touchUpInside)
        return button
    }()
    
    init(delegate: LoginViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        if let type = TextField(rawValue: textField.tag) {
            let newText = textField.getText(range, replacementString: string)
            delegate?.textDidChange(in: type, text: newText)
        }
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.moveToNextTextTextField()
        return true
    }
    @objc private func loginTapped() {
        delegate?.didTapButton(type: .login)
    }
    @objc private func forgotPassword() {
        delegate?.didTapButton(type: .forgot)
    }
    @objc private func notExistUsername() {
        delegate?.didTapButton(type: .notExist)
    }
    private func setBottomConstraint(with height: CGFloat) {
        UIView.animate(withDuration: 1) { [weak self] in
            guard let `self` = self else { return }
            self.containerView.snp.remakeConstraints { make in
                make.top.equalTo(height)
                make.left.equalToSuperview().offset(self.appearance.sideOffset)
                make.right.equalToSuperview().inset(self.appearance.sideOffset)
            }
            self.containerView.superview?.layoutIfNeeded()
        }
    }
    func setKeyboard(isVisible: Bool) {
        setBottomConstraint(with: isVisible ? appearance.containerTopOffset/2 : appearance.containerTopOffset)
    }
}

extension LoginView {
    private func setupView() {
        backgroundColor = appearance.backgroundColor
        addSubview(containerView)
        containerView.addSubviews([emailTextField, passwordTextField, forgotPasswordButton, loginButton, notExistButton])
    }
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(appearance.containerTopOffset)
            make.left.equalToSuperview().offset(appearance.sideOffset)
            make.right.equalToSuperview().inset(appearance.sideOffset)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(appearance.textFieldHeight)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(appearance.xsSpace)
            make.left.right.equalToSuperview()
            make.height.equalTo(appearance.textFieldHeight)
        }
        forgotPasswordButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField.snp.centerY)
            make.right.equalToSuperview()
            make.size.equalTo(appearance.forgotButton.size)
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(appearance.loginButton.topOffset)
            make.centerX.equalToSuperview()
            make.size.equalTo(appearance.loginButton.size)
        }
        notExistButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(appearance.notExitsButton.topOffset)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension LoginView {
    struct Appearance: Grid {
        let scrollScreen = UIScreen.main.bounds
        let sideOffset = 15.adjusted
        let containerTopOffset = 211.adjusted
        let textFieldHeight = 44.adjusted
        let backgroundColor = Color.white.color
        let forgotButton = ForgotButton()
        let loginButton = LoginButton()
        let notExitsButton = NotExistedButton()
        
        struct NotExistedButton {
            let topOffset = 21.adjusted
            let font: UIFont = Font.subheadFirst(size: 15).font
            let textColor: UIColor = Color.windowsBlue.color
        }
        struct LoginButton {
            let size = CGSize(width: 147, height: 44).adjusted
            let topOffset = 34.adjusted
            let font: UIFont = FontFamily.SFProText.medium.font(size: 15)
            let cornerRadius: CGFloat = 22.adjusted
            let backgroundColor = Color.tangerine.color
        }
        struct ForgotButton {
            let textColor = Color.brownGrey.color
            let font: Font = .captionFirst(size: 12)
            let cornerRadius: CGFloat = 4.adjusted
            let borderWidth: CGFloat = 0.5.adjusted
            let size = CGSize(width: 113, height: 30).adjusted
        }
    }
}


