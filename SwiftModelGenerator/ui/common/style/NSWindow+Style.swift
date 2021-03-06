//
//  NSWindow+Style.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/26/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation
import AppKit

extension NSWindow: DecoratorCompatible {}

// MARK: common
struct WindowStyle {
    
    static var titleBarTransparent: Decoration<NSWindow> {
        return {
            (window: NSWindow) -> Void in
            window.titlebarAppearsTransparent = true
            window.titleVisibility = NSWindow.TitleVisibility.hidden
        }
    }
    
    static var appearanceDark: Decoration<NSWindow> {
        return {
            (window: NSWindow) -> Void in
            window.appearance = NSAppearance(named: NSAppearance.Name.vibrantDark)
        }
    }
    
    static var movableByBackground: Decoration<NSWindow> {
        return {
            (window: NSWindow) -> Void in
            window.isMovableByWindowBackground = true
        }
    }
}

// MARK: colors
extension WindowStyle {
    
    static var bgrWhite: Decoration<NSWindow> {
        return {
            (window: NSWindow) -> Void in
            window.backgroundColor = NSColor.white
        }
    }
    
    static var bgrDarkGrey: Decoration<NSWindow> {
        return {
            (window: NSWindow) -> Void in
            window.backgroundColor = NSColor.AppDarkGrey
        }
    }
}
