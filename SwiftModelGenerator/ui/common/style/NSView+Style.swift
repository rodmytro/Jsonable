//
//  NSView+Style.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/26/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation
import AppKit

extension NSView: DecoratorCompatible {}

//MARK: Shape
struct Style {
    
    static var cornersSmall: Decoration<NSView> {
        return {
            (view: NSView) -> Void in
            view.wantsLayer = true
            view.layer?.cornerRadius = 3
        }
    }
    
    static var cornersNormal: Decoration<NSView> {
        return {
            (view: NSView) -> Void in
            view.wantsLayer = true
            view.layer?.cornerRadius = 10
        }
    }
    
    static var bordersWhite: Decoration<NSView> {
        return {
            (view: NSView) -> Void in
            view.wantsLayer = true
            view.layer?.borderColor = NSColor.white.cgColor
            view.layer?.borderWidth = 1.3
        }
    }
}

// Background
extension Style {
    
    static var appearanceDark: Decoration<NSView> {
        return {
            (view: NSView) -> Void in
            view.appearance = NSAppearance(named: NSAppearance.Name.vibrantDark)
        }
    }
    
    static var bgrBlack: Decoration<NSView> {
        return {
            (view: NSView) -> Void in
            view.wantsLayer = true
            view.layer?.backgroundColor = NSColor.black.cgColor
        }
    }
    
}
