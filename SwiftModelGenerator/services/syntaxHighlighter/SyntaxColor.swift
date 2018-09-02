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
    case simple
    case className
    case classVar
    case string
    case function
    case statement
    case type
    case modifier
}

extension SyntaxColor {
    
    var color: NSColor {
        switch self {
        case .simple: return NSColor.white
        case .className: return NSColor.initFrom(htmlColor: "#FDB084")
        case .classVar: return NSColor.initFrom(htmlColor: "#C7CECE")
        case .string: return NSColor.initFrom(htmlColor: "#8A9396")
        case .function: return NSColor.initFrom(htmlColor: "#FD7E80")
        case .type: return NSColor.initFrom(htmlColor: "#FD7E80")
        case .statement: return NSColor.initFrom(htmlColor: "#A3E9A8")
        case .modifier: return NSColor.initFrom(htmlColor: "#A3E9A8")
        }
    }
    
}
