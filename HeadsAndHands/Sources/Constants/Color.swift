//
//  Color.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/10/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import UIKit

public extension UIColor {
    convenience init(_ hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let alpha, red, green, blue: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (alpha, red, green, blue) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (alpha, red, green, blue) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (alpha, red, green, blue) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (alpha, red, green, blue) = (255, 0, 0, 0)
        }
        print("red: \(CGFloat(red) / 255)\ngreen: \(CGFloat(green) / 255)\nblue: \(CGFloat(blue) / 255)\nalpha: \(CGFloat(alpha) / 255)")
        self.init(red: CGFloat(red) / 255,
                  green: CGFloat(green) / 255,
                  blue: CGFloat(blue) / 255,
                  alpha: CGFloat(alpha) / 255)
    }
    convenience init(rgbaValue: UInt32) {
        let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
        let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
        let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
        let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

public enum Color: String {
    
    case darkSkyBlueTwo = "#37383D"
    case black = "#333333"
    case white = "#FFFFFF"
    case warmGrey = "#797979"
    case tangerine = "#ff9b00"
    case windowsBlue = "#3785c8"
    
    public var color: UIColor {
        return UIColor(self.rawValue)
    }
    
    public var colorName: String {
        switch self {
        case .darkSkyBlueTwo:
            return "Dark Sky Blue Second"
        case .black:
            return "Black"
        case .white:
            return "White"
        case .warmGrey:
            return "Warm Grey"
        case .tangerine:
            return "Tangerine"
        case .windowsBlue:
            return "Windows Blue"
        }
    }
    public var hexName: String {
        return self.rawValue
    }
}
