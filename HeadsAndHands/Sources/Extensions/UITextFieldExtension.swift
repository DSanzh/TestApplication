//
//  UITextFieldExtension.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/24/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import UIKit

extension UITextField {
    public func getText(_ range: NSRange,
                        replacementString string: String) -> String {
        let newString = NSString(string: text!).replacingCharacters(in: range, with: string)
        return newString
    }
    public func moveToNextTextTextField() {
        let nextTag = tag + 1
        
        if let nextResponder = superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            resignFirstResponder()
        }
    }
}
