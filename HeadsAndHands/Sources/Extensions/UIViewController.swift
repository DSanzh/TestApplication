//
//  UIViewController.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/17/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import UIKit

extension UIViewController {
    /// Wrap to UINavigation Controller
    func wrapToNavigationController() -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: self)
        return navigationController
    }
    func setTitle(text: String, color type: Color? = Color.black, font: UIFont? = FontFamily.SFProText.medium.font(size: 17)) {
        title = text
        var attributes: [NSAttributedString.Key: Any] = [:]
        if let type = type { attributes[NSAttributedString.Key.foregroundColor] = type.color }
        if let font = font { attributes[NSAttributedString.Key.font] = font }
        navigationController?.navigationBar.titleTextAttributes = attributes
    }
}
