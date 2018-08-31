//
//  String+SwiftableKey.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/31/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation

public extension String {
    public var camelCase: String {
        var value = self
        
        while let indexOfUnderscore = value.index(of: "_") {
            let indexOfNextChar = value.index(indexOfUnderscore, offsetBy: 1)
            let nextChar = String(value[indexOfNextChar]).uppercased()
            
            value.replaceSubrange(indexOfUnderscore...indexOfNextChar, with: nextChar)
        }
        
        return value
    }
}
