//
//  Fonts.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/23/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import UIKit

public protocol StyledTextProtocol {
    var styledText: NSAttributedString { get }
}

public enum Typography: StyledTextProtocol {
    
    /// SFProDisplay.bold.font(34)
    case titleFirst(string: String, color: Color, aligment: NSTextAlignment)
    
    /// SFProDisplay.bold.font(28)
    case titleSecond(string: String, color: Color, aligment: NSTextAlignment)
    
    /// SFProDisplay.bold.font(25)
    case titleThrid(string: String, color: Color, aligment: NSTextAlignment)
    
    /// SFProDisplay.bold.font(20)
    case titleFourth(string: String, color: Color, aligment: NSTextAlignment)
    
    /// SFProText.semibold.font(17)
    case headline(string: String, color: Color, aligment: NSTextAlignment)
    
    /// SFProText.regular.font(17)
    case body(string: String, color: Color, aligment: NSTextAlignment)
    
    /// SFProText.regular.font(16)
    case callout(string: String, color: Color, aligment: NSTextAlignment)
    
    /// SFProText.regular.font(15)
    case subheadFirst(string: String, color: Color, aligment: NSTextAlignment)
    
    /// SFProText.semibold.font(15)
    case subheadSecond(string: String, color: Color, aligment: NSTextAlignment)
    
    /// SFProText.regular.font(13)
    case footnoteFirst(string: String, color: Color, aligment: NSTextAlignment)
    
    /// SFProText.semibold.font(13)
    case footnoteSecond(string: String, color: Color, aligment: NSTextAlignment)
    
    /// SFProText.regular.font(12)
    case captionFirst(string: String, color: Color, aligment: NSTextAlignment)
    
    /// SFProText.semibold.font(11)
    case captionSecond(string: String, color: Color, aligment: NSTextAlignment)
    
    public var styledText: NSAttributedString {
        switch self {
        case let .titleFirst(text, colorType, aligment):
            return NSAttributedString(text,
                                      color: colorType.color,
                                      font: Font.titleFirst(size: 34).font,
                                      alignment: aligment,
                                      lineSpacing: 0.41,
                                      letterSpacing: 0.41,
                                      lineBreakMode: nil)
        case let .titleSecond(text, colorType, aligment):
            return NSAttributedString(text,
                                      color: colorType.color,
                                      font: Font.titleSecond(size: 28).font,
                                      alignment: aligment,
                                      lineSpacing: 0.34,
                                      letterSpacing: 0.36,
                                      lineBreakMode: nil)
        case let .titleThrid(text, colorType, aligment):
            return NSAttributedString(text,
                                      color: colorType.color,
                                      font: Font.titleThrid(size: 25).font,
                                      alignment: aligment,
                                      lineSpacing: 0.36,
                                      letterSpacing: 0.25,
                                      lineBreakMode: nil)
        case let .titleFourth(text, colorType, aligment):
            return NSAttributedString(text,
                                      color: colorType.color,
                                      font: Font.titleFourth(size: 20).font,
                                      alignment: aligment,
                                      lineSpacing: 0.38,
                                      letterSpacing: 0.24,
                                      lineBreakMode: nil)
        case let .headline(text, colorType, aligment):
            return NSAttributedString(text,
                                      color: colorType.color,
                                      font: Font.headline(size: 17).font,
                                      alignment: aligment,
                                      lineSpacing: 0.22,
                                      letterSpacing: -0.41,
                                      lineBreakMode: nil)
        case let .body(text, colorType, aligment):
            return NSAttributedString(text,
                                      color: colorType.color,
                                      font: Font.body(size: 17).font,
                                      alignment: aligment,
                                      lineSpacing: 0.22,
                                      letterSpacing: -0.41,
                                      lineBreakMode: nil)
        case let .callout(text, colorType, aligment):
            return NSAttributedString(text,
                                      color: colorType.color,
                                      font: Font.callout(size: 16).font,
                                      alignment: aligment,
                                      lineSpacing: 0.21,
                                      letterSpacing: -0.3,
                                      lineBreakMode: nil)
        case let .subheadFirst(text, colorType, aligment):
            return NSAttributedString(text,
                                      color: colorType.color,
                                      font: Font.subheadFirst(size: 15).font,
                                      alignment: aligment,
                                      lineSpacing: 0.20,
                                      letterSpacing: -0.24,
                                      lineBreakMode: nil)
        case let .subheadSecond(text, colorType, aligment):
            return NSAttributedString(text,
                                      color: colorType.color,
                                      font: Font.subheadSecond(size: 15).font,
                                      alignment: aligment,
                                      lineSpacing: 0.20,
                                      letterSpacing: -0.09,
                                      lineBreakMode: nil)
        case let .footnoteFirst(text, colorType, aligment):
            return NSAttributedString(text,
                                      color: colorType.color,
                                      font: Font.footnoteFirst(size: 13).font,
                                      alignment: aligment,
                                      lineSpacing: 0.18,
                                      letterSpacing: -0.08,
                                      lineBreakMode: nil)
        case let .footnoteSecond(text, colorType, aligment):
            return NSAttributedString(text,
                                      color: colorType.color,
                                      font: Font.footnoteSecond(size: 13).font,
                                      alignment: aligment,
                                      lineSpacing: 0.18,
                                      letterSpacing: -0.08,
                                      lineBreakMode: nil)
        case let .captionFirst(text, colorType, aligment):
            return NSAttributedString(text,
                                      color: colorType.color,
                                      font: Font.captionFirst(size: 12).font,
                                      alignment: aligment,
                                      lineSpacing: 0.16,
                                      letterSpacing: 0.0,
                                      lineBreakMode: nil)
        case let .captionSecond(text, colorType, aligment):
            return NSAttributedString(text,
                                      color: colorType.color,
                                      font: Font.captionSecond(size: 11).font,
                                      alignment: aligment,
                                      lineSpacing: 0.07,
                                      letterSpacing: 0.13,
                                      lineBreakMode: nil)
        }
    }
}
