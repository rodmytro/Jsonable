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
    let className: String
    
    var keywords: [String: SyntaxColor] =
        [ "Int": .type,
          "Double": .type,
          "String": .type,
          "Bool": .type,
          "Int?": .type,
          "Double?": .type,
          "String?": .type,
          "Bool?": .type,
          "[Any?]": .type,
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
          ":": .statement,
          "import": .statement,
          "throws": .statement,
          "try": .statement,
          "case": .statement ]
    
    required init(code: String, className: String) {
        self.output = NSMutableAttributedString(string: code)
        self.className = className
    }
    
    var highlighted: NSMutableAttributedString {
        output <- [AttrTextStyle.color(SyntaxColor.simple.color)]
        
        highlightStrings()
        highlightClassVar()
        highlightKeywords()
        
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
    
    func highlightClassVar() {
        let regex = try? NSRegularExpression(pattern: " \\.[a-zA-Z0-9_]*")
        let range = NSMakeRange(0, output.length)
        guard let matches = regex?.matches(in: output.string, options: [], range: range) else { return }
        
        for match in matches {
            output <- [AttrTextStyle.color(SyntaxColor.classVar.color, atRange: match.range)]
        }
    }
    
    
}
