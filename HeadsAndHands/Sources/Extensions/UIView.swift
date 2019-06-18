//
//  UIView.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/17/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import UIKit

extension UIView {
    /// Add array of views to subview
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
}
