//
//  NSView+Decorator.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/26/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation
import AppKit

//MARK decorator

infix operator <-

typealias Decoration<T> = (T) -> Void

struct Decorator<T> {
    let object: T
    func apply(_ decorations: Decoration<T>...) -> Void {
        decorations.forEach({ $0(object) })
    }
}

protocol DecoratorCompatible {
    associatedtype DecoratorCompatibleType
    var decorator: Decorator<DecoratorCompatibleType> { get }
}

extension DecoratorCompatible {
    var decorator: Decorator<Self> {
        return Decorator(object: self)
    }
    
    static internal func <- (lhs: Self, rhs: [Decoration<Self>]) {
        for decoration in rhs {
            lhs.decorator.apply(decoration)
        }
    }
}

