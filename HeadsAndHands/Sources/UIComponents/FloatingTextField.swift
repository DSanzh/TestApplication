//
//  FloatingTextField.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/24/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import UIKit

class FloatingTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FloatingTextField {
    private func setupView() {
        textColor = Color.black.color
        addUnderLine(with: .veryLightPink)
        addFloatingPlaceholderWith(font: Font.footnoteFirst(size: 13).font, color: .brownGrey)
    }
}
