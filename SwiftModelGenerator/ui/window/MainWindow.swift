//
//  MainWindow.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/24/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation
import AppKit

class MainWindow: NSWindow {
    
    @IBOutlet weak var containerView: NSView!
    
    var router: BaseRouter!
    
    override func awakeFromNib() {
        
        router = ViewRouter(container: containerView)
        router.onControllerChangedListener = { destinationController in }
        
        router.show(controller: .mainScreen) { controller in }
        
        applyStyle()
    }
    
    func applyStyle() {
        isMovableByWindowBackground = true
        self <- [WindowStyle.appearanceDark]
    }
    
    
}
