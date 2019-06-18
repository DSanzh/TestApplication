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
}
