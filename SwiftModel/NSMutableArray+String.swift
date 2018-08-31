//
//  NSMutableArray+String.swift
//  SwiftModel
//
//  Created by Dmytro Romaniuk on 8/31/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation
import XcodeKit

extension XCSourceTextBuffer {
    
    var selection: String? {
        var result = String()
        
        guard let selectedRange =
            selections.firstObject as? XCSourceTextRange else { return nil }
        
        for i in selectedRange.start.line...selectedRange.end.line {
            if let line = lines[i] as? String {
                result += line
            }
        }
        
        return result
    }
    
}
