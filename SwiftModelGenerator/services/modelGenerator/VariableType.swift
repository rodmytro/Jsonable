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
    case CustomObject(String, JSON)
    case AnyArray
}

extension VariableType {
    var swiftable: String {
        switch self {
        case .String: return "String"
        case .Bool: return "Bool"
        case .Double: return "Double"
        case .Int: return "Int"
        case .CustomObject(let name, _): return name.upperCamelCase
        case .AnyArray: return "[Any?]"
        }
    }
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
        } else if let dict = js.dictionary,
            let name = dict.keys.first,
            let value = dict.values.first{
            self = .CustomObject(name, value)
        } else if let _ = js.array {
            self = .AnyArray
        } else {
            self = .AnyArray
        }
    }
}
