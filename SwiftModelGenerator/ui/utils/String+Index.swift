//
//  String+Index.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/30/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation

extension String {
    subscript (index: Int) -> Character? {
        guard (index >= 0) && (index < self.utf8.count) else {
            return nil
        }
        
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}
