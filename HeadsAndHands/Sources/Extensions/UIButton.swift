//
//  UIButton.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/24/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setCorner(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    func setBorder(width: CGFloat, color: Color) {
        self.layer.borderColor = color.color.cgColor
        self.layer.borderWidth = width
    }
    
    func setFont(with font: Font) {
        titleLabel?.font = font.font
    }
    func setFont(with font: UIFont) {
        titleLabel?.font = font
    }
    
}
