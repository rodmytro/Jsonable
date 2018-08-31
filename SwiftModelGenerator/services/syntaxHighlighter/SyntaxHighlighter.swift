//
//  SyntaxHighlightManager.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/31/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation

protocol SyntaxHighlighter {
    
    init(code: String)
    
    var highlighted: NSMutableAttributedString { get }
    
}
