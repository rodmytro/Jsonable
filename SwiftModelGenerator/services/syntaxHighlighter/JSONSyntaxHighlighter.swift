//
//  JSONSyntaxHighlighter.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 9/1/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation
import AppKit

class JSONSyntaxHighlighter: SyntaxHighlighter {
    let output: NSMutableAttributedString
    let className: String
    
    var keywords: [String: SyntaxColor] =
        [ ":": .statement,
          "(": .simple,
          ")": .simple,
          "{": .simple,
          "}": .simple,
          "[": .simple,
          "]": .simple,
          ",": .simple,
          ]
          
    required init(code: String, className: String) {
        self.output = NSMutableAttributedString(string: code)
        self.className = className
    }
    
    var highlighted: NSMutableAttributedString {
        output <- [AttrTextStyle.color(SyntaxColor.className.color)]
        
        highlightKeywords()
        highlightStrings()
        highlightKeys()
        
        return output
    }
    
    func highlightKeywords() {
        keywords[className] = .className
        
        for (keyword, syntax) in keywords {
            let ranges = output.nsRanges(of: keyword)
            
            for range in ranges {
                output <- [AttrTextStyle.color(syntax.color, atRange: range)]
            }
        }
    }
    
    func highlightStrings() {
        let regex = try? NSRegularExpression(pattern: "\"[a-zA-Z0-9_]*\"")
        let range = NSMakeRange(0, output.length)
        guard let matches = regex?.matches(in: output.string, options: [], range: range) else { return }
        
        for match in matches {
            output <- [AttrTextStyle.color(SyntaxColor.string.color, atRange: match.range)]
        }
    }
    
    func highlightKeys() {
        let regex = try? NSRegularExpression(pattern: "\"[a-zA-Z0-9_]*\":")
        let range = NSMakeRange(0, output.length)
        guard let matches = regex?.matches(in: output.string, options: [], range: range) else { return }
        
        for match in matches {
            output <- [AttrTextStyle.color(SyntaxColor.statement.color, atRange: match.range)]
        }
    }
    
    
}
