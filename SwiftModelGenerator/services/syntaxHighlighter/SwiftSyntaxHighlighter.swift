//
//  SwiftSyntaxHighlighter.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/31/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation
import AppKit

class SwiftSyntaxHighlighter: SyntaxHighlighter {
    let output: NSMutableAttributedString
    
    let keywords: [String : SyntaxColor] =
        [ "Int": .type,
          "Double": .type,
          "String": .type,
          "Bool": .type,
          "Int?": .type,
          "Double?": .type,
          "String?": .type,
          "Bool?": .type,
          "CodingKey": .type,
          "CodingKeys": .type,
          "Decodable": .type,
          "Decoder": .type,
          "struct": .modifier,
          "self": .statement,
          "let": .statement,
          "extension": .modifier,
          "enum": .modifier,
          "private": .modifier,
          "init": .statement,
          "throws": .statement,
          "try": .statement,
          "case": .statement ]
    
    required init(code: String) {
        self.output = NSMutableAttributedString(string: code)
    }
    
    var highlighted: NSMutableAttributedString {
        output <- [AttrTextStyle.color(NSColor.white)]
        
        for (keyword, syntax) in keywords {
            let ranges = output.nsRanges(of: keyword)
        
            for range in ranges {
                output <- [AttrTextStyle.color(syntax.color, atRange: range)]
            }
        }
            
        
        return output
    }
    
    
}
