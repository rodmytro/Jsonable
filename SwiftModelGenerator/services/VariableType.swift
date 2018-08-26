//
//  VarType.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/25/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation

enum VariableType {
    case String
    case Bool
    case Double
    case Int
    case OtherObject(String) 
    case AnyObject
    case AnyArray
    case OtherArray(String) 
}

extension VariableType {
    init(from js: JSON) {
        if js.string != nil {
            self = .String
        } else if js.number != nil {
            self = .Int
        } else if js.bool != nil {
            self = .Bool
        } else if js.double != nil {
            self = .Double
        } else if let _ = js.array {
            self = .OtherArray("SomeObject")
        } else {
            self = .AnyObject
        }
    }
}
