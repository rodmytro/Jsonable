//
//  NSView+Style.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/26/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation
import AppKit

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
