//
//  Data+Dictionary.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/26/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation

extension Data {
    var dictionary: [String: AnyObject]? {
        do {
            return try JSONSerialization.jsonObject(with: self, options: []) as? [String : AnyObject]
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
        
        return nil
    }
}
