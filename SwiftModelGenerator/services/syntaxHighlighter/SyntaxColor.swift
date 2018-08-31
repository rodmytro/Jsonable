//
//  SyntaxColor.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/31/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation
import AppKit

enum SyntaxColor {
    case function
    case statement
    case type
    case modifier
}

extension SyntaxColor {
    
    var color: NSColor {
        switch self {
        case .function: return NSColor.initFrom(htmlColor: "#FD7E80")
        case .type: return NSColor.initFrom(htmlColor: "#FD7E80")
        case .statement: return NSColor.initFrom(htmlColor: "#A3E9A8")
        case .modifier: return NSColor.initFrom(htmlColor: "#9DECCE")
        }
    }
    
}
