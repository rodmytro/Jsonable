//
//  NSAttributedString+Style.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/26/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation
import AppKit

extension NSAttributedString: DecoratorCompatible {}

class AttrTextStyle {
    
    //MARK: COLOR
    
    static func color(_ value: NSColor, atRange range: NSRange) -> Decoration<NSMutableAttributedString> {
        return {
            (attrString: NSMutableAttributedString) -> Void in
            
            attrString.addAttributes([NSAttributedStringKey.foregroundColor: value], range: range)
        }
    }
    
    static func color(_ value: NSColor) -> Decoration<NSMutableAttributedString> {
        return {
            (attrString: NSMutableAttributedString) -> Void in
            
            let allTextRange = NSMakeRange(0, attrString.length)
            attrString.addAttributes([NSAttributedStringKey.foregroundColor: value], range: allTextRange)
        }
    }
    
    static var colorWhite: Decoration<NSMutableAttributedString> {
        return color(NSColor.white)
    }
    
    
    // MARK: FONT
    
    static func font(_ value: NSFont) -> Decoration<NSMutableAttributedString> {
        return {
            (attrString: NSMutableAttributedString) -> Void in
            
            let allTextRange = NSMakeRange(0, attrString.length)
            attrString.addAttributes([NSAttributedStringKey.font: value], range: allTextRange)
        }
    }
    
    static var courier13: Decoration<NSMutableAttributedString> {
        return font(NSFont.init(name: "Courier New", size: 13)!)
    }
}
