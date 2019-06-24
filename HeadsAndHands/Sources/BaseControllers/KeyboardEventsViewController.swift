//
//  KeyboardEventsViewController.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/24/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import UIKit

class KeyboardEventsViewController: UIViewController {
    
    // MARK: - Life Cycle
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        unsubscribeForEvents()
    }
    
    // MARK: - Keyboard
    func unsubscribeForEvents() {
        NotificationCenter.default.removeObserver(self)
    }
    
    func subscribeForKeyboardEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillAppear(notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            keyboardWillAppearWithHeight(keyboardHeight)
        }
    }
    
    @objc func keyboardWillDisappear() { }
    
    func keyboardWillAppearWithHeight(_ keyboardHeight: CGFloat) { }
    
}
