//
//  ModelError.swift
//  SwiftModel
//
//  Created by Dmytro Romaniuk on 8/31/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation

enum CustomError: Error {
    case wrongJson
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .wrongJson: return "NOT KOSHER JSON"
        }
    }
    
    public var localizedDescription: String? {
        return errorDescription
    }
}
