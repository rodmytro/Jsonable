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
extension TextStyle {
    
    static var bgrBlack: Decoration<NSTextView> {
        return {
            (view: NSTextView) -> Void in
            view.backgroundColor = NSColor.black
        }
    }
    
    static var textWhite: Decoration<NSTextView> {
        return {
            (view: NSTextView) -> Void in
            view.textColor = NSColor.white
        }
    }
    
}
