//
//  BaseRouter.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/24/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation

protocol BaseRouter {
    
    typealias onControllerChangeAction = ((AppViewController) -> Void)
    typealias onControllerAction = ((BaseVC) -> Void)
    
    var onControllerChangedListener: onControllerChangeAction? { get set }
    
    var currentController: BaseVC? { get }
    
    func show(controller: AppViewController, action: @escaping onControllerAction)
    
    func show(controller: AppViewController, withAnimation animation: ViewTransitionAnimation, action: @escaping onControllerAction)
    
}

struct AppViewController {
    let controllerClass: BaseVC.Type
    
    var nibName: String {
        return controllerClass.className()
    }
    
    private init(controllerClass: BaseVC.Type) {
        self.controllerClass = controllerClass
    }
    
    static var mainScreen: AppViewController {
        return AppViewController(controllerClass: MainVC.self)
    }
    
}
