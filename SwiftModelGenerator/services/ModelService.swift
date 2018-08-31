//
//  ModelService.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/31/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation

public class ModelService {
    
    let string: String
    let className: String
    
    public init(from string: String, andName className: String) {
        self.string = string
        self.className = className
    }
    
    public func generate() -> String? {
        guard let jsonData = string.data(using: .utf8),
              let dictionary = jsonData.dictionary else { return nil }
        
        let json = JSON(dictionary)
        let generator = ModelGenerator(from: json, andName: className)
        
        return generator.output
    }
    
}
