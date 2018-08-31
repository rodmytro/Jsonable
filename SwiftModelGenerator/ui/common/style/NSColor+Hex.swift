//
//  NSColor+Hex.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/30/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation
import AppKit

extension NSColor {
    
    static func initFromHtml(r: Int, g: Int, b: Int, a: Int) -> NSColor {
        return NSColor(red: CGFloat(r) / 256, green: CGFloat(g) / 256, blue: CGFloat(b) / 256, alpha: CGFloat(a) / 256)
    }
    
    static func initFromHtml(r: Int, g: Int, b: Int) -> NSColor {
        return NSColor(red: CGFloat(r) / 256, green: CGFloat(g) / 256, blue: CGFloat(b) / 256, alpha: 1)
    }
    
}

extension NSColor {
    
    static func initFrom(htmlColor color: String) -> NSColor {
        var redString = String(color[1]!)
        redString.append(color[2]!)
        
        var greenString = String(color[3]!)
        greenString.append(color[4]!)
        
        var blueString = String(color[5]!)
        blueString.append(color[6]!)
        
        if color.count > 7 {
            var alphaString = String(color[7]!)
            alphaString.append(color[8]!)
            
            return NSColor.initFromHtml(r: Int(redString, radix: 16)!, g: Int(greenString, radix: 16)!, b: Int(blueString, radix: 16)!, a: Int(alphaString, radix: 16)!)
        }
        
        return NSColor.initFromHtml(r: Int(redString, radix: 16)!, g: Int(greenString, radix: 16)!, b: Int(blueString, radix: 16)!)
    }
    
}
