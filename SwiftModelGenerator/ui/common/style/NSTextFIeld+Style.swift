//
//  NSTextView+Style.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/26/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation
import AppKit

//MARK: - GLOBAL -
struct TextStyle {
    
    static var bgrTransparent: Decoration<NSTextField> {
        return {
            (view: NSTextField) -> Void in
            view.bezelStyle = NSTextField.BezelStyle.roundedBezel
            view.isBordered = false
            view.drawsBackground = false
        }
    }
    
    static var editingDisabled: Decoration<NSTextField> {
        return {
            (view: NSTextField) -> Void in
            view.isEditable = false
            view.isSelectable = false
        }
    }
    
    static var clicksDisabled: Decoration<NSTextField> {
        return {
            (view: NSTextField) -> Void in
            view.isEnabled = false
            view.ignoresMultiClick = true
        }
    }
    
    static var caretGrey: Decoration<NSTextField> {
        return {
            (view: NSTextField) -> Void in
            //            view
        }
    }
    
    static var focusNone: Decoration<NSTextField> {
        return {
            (view: NSTextField) -> Void in
            view.focusRingType = NSFocusRingType.none
        }
    }
}

//MARK: - FONT APPEARENCE -
extension TextStyle {
    static var fontAppHeader: Decoration<NSTextField> {
        return {
            (view: NSTextField) -> Void in
            view.alignment = NSTextAlignment.center
            view.font = NSFont(name: ".SFNSDisplay-Regular", size: 15)
        }
    }
    
    static var multipleLines: Decoration<NSTextField> {
        return {
            (view: NSTextField) -> Void in
            view.maximumNumberOfLines = 2
        }
    }
    
    static var truncateDots: Decoration<NSTextField> {
        return {
            (view: NSTextField) -> Void in
            
            view.lineBreakMode = NSParagraphStyle.LineBreakMode.byTruncatingTail
        }
    }
}
