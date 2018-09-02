//
//  PastableTextView.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/31/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation
import AppKit

class PastableTextView: NSTextView {
    
    var pasteCallback: (() -> Void)?
    
    override func paste(_ sender: Any?) {
        pasteAsPlainText(sender)
        
        if let callback = pasteCallback {
            callback()
        }
    }
    
}
