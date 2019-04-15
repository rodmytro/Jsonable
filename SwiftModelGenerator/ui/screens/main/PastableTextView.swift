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
    
    //"data to excel\n then change line \t then tab a column"
    override func paste(_ sender: Any?) {
        pasteAsPlainText(sender)
        
        if let callback = pasteCallback {
            callback()
        }
    }
    
}
