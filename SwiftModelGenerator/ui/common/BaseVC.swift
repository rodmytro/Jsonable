//
//  BaseVC.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/24/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation
import AppKit

class BaseVC: NSViewController {
    
    var router: BaseRouter!
    
    var keyHandler : Any?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init (nibName: String, router: BaseRouter) {
        super.init(nibName: NSNib.Name(rawValue: nibName), bundle: nil)
        
        self.router = router
    }
    
    override func viewWillDisappear() {
        if let handler = keyHandler {
            NSEvent.removeMonitor(handler)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func saveState() {
        
    }
    
    func restoreState() {
        
    }
    
    func listenToKeyboard() {
        keyHandler = NSEvent.addLocalMonitorForEvents(matching: .keyDown) {
            self.keyDown(with: $0)
            return $0
        }
    }
    
}
