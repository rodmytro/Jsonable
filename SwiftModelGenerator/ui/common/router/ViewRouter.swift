//
//  ViewRouter.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/24/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation
import AppKit

class ViewRouter: BaseRouter {
    
    public var onControllerChangedListener: onControllerChangeAction?
    
    internal var currentController: BaseVC?
    
    private var container: NSView!
    private var isRouting = false
    
    init(container: NSView) {
        self.container = container
    }
    
    //TODO refactor, make different functions
    
    public func show(controller: AppViewController, action: @escaping onControllerAction) {
        guard isRouting == false else {return}
        isRouting = true
        
        if let currentController = currentController {
            currentController.saveState()
        }
        
        let destinationController = getController(fromName: controller.nibName, andClass: controller.controllerClass)
        
        currentController = destinationController
        
        if let onControllerChangedListener = onControllerChangedListener {
            onControllerChangedListener(controller)
        }
        
        //remove old
        container.subviews.removeAll()
        
        //add new
        container.addSubview(destinationController.view)
        destinationController.view.frame = container.frame
        
        action(destinationController)
        
        isRouting = false
    }
    
    public func show(controller: AppViewController, withAnimation animation: ViewTransitionAnimation, action: @escaping onControllerAction) {
        
        guard isRouting == false else {return}
        isRouting = true
        
        if let currentController = currentController {
            currentController.saveState()
        }
        
        let destinationController = getController(fromName: controller.nibName, andClass: controller.controllerClass)
        let currentView = container.subviews.first
        
        currentController = destinationController
        
        if let onControllerChangedListener = onControllerChangedListener {
            onControllerChangedListener(controller)
        }
        
        container.addSubview(destinationController.view)
        
        //TODO is it ok?
        action(destinationController)
        
        if let currentView = currentView { animation.currentViewAnimation(currentView) }
        animation.destinationViewAnimation(container, destinationController.view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.isRouting = false
            
            if let currentView = currentView { currentView.removeFromSuperview() }
            destinationController.view.frame = self.container.frame
        }
        
    }
    
    private func getController<T: BaseVC>(fromName name: String, andClass controllerClass: T.Type) -> T {
        return controllerClass.init(nibName: name, router: self)
    }
    
}
