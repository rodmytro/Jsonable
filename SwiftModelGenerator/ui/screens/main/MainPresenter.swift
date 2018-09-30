//
//  MainPresenter.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/26/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation
import AppKit

class MainPresenter: BasePresenter<MainMvpView> {
    
    var modelCode = ""
    
    func onConvertClick(from jsonText: String) {
        generateModel(from: jsonText)
    }
    
    func onCopyClick() {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(modelCode, forType: .string)
    }
    
    func onPasted(json: String?) {
        guard let json = json else { return }
        
        highlightPasted(json: json)
        generateModel(from: json)
    }
    
    private func generateModel(from jsonText: String) {
        let className = "RENAMEME"
        
        guard let modelCode = ModelService(from: jsonText, andName: className).generate() else { return }
        self.modelCode = modelCode
        
        let attrString = SwiftSyntaxHighlighter(code: modelCode, className: className).highlighted
        attrString <- [AttrTextStyle.courier13]
        
        view.showModel(text: attrString)
    }
    
    private func highlightPasted(json: String) {
        let attrString = JSONSyntaxHighlighter(code: json, className: "").highlighted
        view.showJSON(text: attrString)
    }
    
}
