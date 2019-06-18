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
    }
}

extension WelcomeViewController {
    private func setupView() {
        view.backgroundColor = .white
        view.addSubviews([welcomeText, loginButton])
    }
    private func setupConstraints() {
        welcomeText.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(<#T##amount: ConstraintOffsetTarget##ConstraintOffsetTarget#>)
        }
    }
}

extension WelcomeViewController {
    struct Appearance: Grid { }
}
