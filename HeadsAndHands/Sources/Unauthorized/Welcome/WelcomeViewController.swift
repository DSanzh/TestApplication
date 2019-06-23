//
//  WelcomeViewController.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/10/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {

    let appearance = Appearance()
    private lazy var welcomeText = UILabel()
    private lazy var loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupContent()
        setupActions()
    }
}

extension WelcomeViewController {
    private func setupView() {
        view.backgroundColor = .white
        view.addSubviews([welcomeText, loginButton])
    }
    private func setupConstraints() {
        welcomeText.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(appearance.welcomeLabelTopOffset)
            make.left.equalToSuperview().offset(appearance.sSpace)
            make.right.equalToSuperview().inset(appearance.sSpace)
        }
        loginButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(appearance.xxxlSpace)
            make.left.equalToSuperview().offset(appearance.sSpace)
            make.right.equalToSuperview().inset(appearance.sSpace)
            make.height.equalTo(appearance.xxlSize.height)
        }
    }
    private func setupContent() {
        welcomeText.attributedText = Typography.titleFirst(string: L10n.Welcome.main,
                                                           color: .black,
                                                           aligment: .center).styledText
        loginButton.setAttributedTitle(Typography.subheadSecond(string: L10n.Common.next,
                                                                color: .darkSkyBlueTwo,
                                                                aligment: .center).styledText,
                                       for: .normal)
        
    }
    private func setupActions() {
        loginButton.addTarget(self, action: #selector(presentLogin), for: .touchUpInside)
    }
    @objc private func presentLogin() {
        
    }
}

extension WelcomeViewController {
    struct Appearance: Grid {
        let welcomeLabelTopOffset = 150
    }
}
