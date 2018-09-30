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
        router.show(controller: .mainScreen) { controller in }
        
        setupStyle()
    }
    
    func setupStyle() {
        self <- [WindowStyle.movableByBackground, WindowStyle.appearanceDark,
                 WindowStyle.bgrDarkGrey, WindowStyle.titleBarTransparent]
    }
    
}

extension MainWindow: NSWindowDelegate {
    
}
