//
//  NSAttributedString+Range.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/31/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {
    func range(of string: String) -> Range<String.Index>? {
        return self.string.range(of: string)
    }
    
    func ranges(of string: String, options: String.CompareOptions = [],
                locale: Locale? = nil) -> [Range<String.Index>] {
        return self.string.ranges(of: string, options: options, locale: locale)
    }
    
    func nsRanges(of string: String, options: String.CompareOptions = [],
                locale: Locale? = nil) -> [NSRange] {
        return self.string.ranges(of: string, options: options, locale: locale)
            .map{ NSRange($0, in: self.string) }
    }
}
