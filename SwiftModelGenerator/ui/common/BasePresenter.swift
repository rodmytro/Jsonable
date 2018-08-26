//
//  BasePresenter.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/24/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation

class BasePresenter<T>: NSObject {
    
    var view: T!
    
    public init(view: T) {
        self.view = view
    }
}
