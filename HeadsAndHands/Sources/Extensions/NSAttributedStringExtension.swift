//
//  NSAttributedStringExtension.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/23/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import UIKit

extension NSAttributedString {
    convenience init(_ string: String,
                     color: UIColor = .black,
                     font: UIFont = Font.body(size: 14).font,
                     alignment: NSTextAlignment = .left,
                     lineSpacing: CGFloat?,
                     letterSpacing: CGFloat?,
                     lineHeight: CGFloat? = nil,
                     lineBreakMode _: NSLineBreakMode? = nil) {
        let paragraphStyle = NSMutableParagraphStyle()
        
        if let lineSpacing = lineSpacing {
            paragraphStyle.lineSpacing = lineSpacing
        }
        if let lineHeight = lineHeight {
            paragraphStyle.minimumLineHeight = lineHeight
            //            paragraphStyle.lineHeightMultiple = lineHeight
            paragraphStyle.maximumLineHeight = lineHeight
        }
        paragraphStyle.alignment = alignment
        paragraphStyle.lineBreakMode = .byTruncatingTail
        var attrs: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.font: font,
        ]
        if let letterSpacing = letterSpacing {
            attrs[NSAttributedString.Key.kern] = letterSpacing
        }
        self.init(string: string, attributes: attrs)
    }
    
    struct AttributesConfig {
        var font: UIFont?
        var textColor: UIColor?
    }
    struct ParagraphConfig {
        var lineHeight: CGFloat?
        var lineSpacing: CGFloat?
    }
    convenience init(with text: String,
                     attributesConfig: AttributesConfig,
                     paragraphConfig: ParagraphConfig) {
        
        let paragraph: NSMutableParagraphStyle = NSMutableParagraphStyle()
        if let lineSpacing = paragraphConfig.lineSpacing { paragraph.lineSpacing = lineSpacing }
        if let lineHeight = paragraphConfig.lineHeight { paragraph.minimumLineHeight = lineHeight }
        
        var attributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.paragraphStyle: paragraph]
        
        if let font = attributesConfig.font { attributes[NSAttributedString.Key.font] = font }
        if let textColor = attributesConfig.textColor { attributes[NSAttributedString.Key.foregroundColor] = textColor }
        
        self.init(string: text, attributes: attributes)
    }
    
    
    func heightForWidth(_ width: CGFloat) -> CGFloat {
        return ceil(boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude),
                                 options: [.usesLineFragmentOrigin, .usesFontLeading],
                                 context: nil).size.height)
    }
    
    func widthForHeight(_ height: CGFloat) -> CGFloat {
        return ceil(boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: height),
                                 options: [.usesLineFragmentOrigin, .usesFontLeading],
                                 context: nil).size.width)
    }
}

