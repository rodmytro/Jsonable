//
//  MainPresenter.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/26/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation

class MainPresenter: BasePresenter<MainMvpView> {
    
    func generateModel(from jsonText: String) {
        let className = "MyClass"
        
        guard let modelCode = ModelService(from: jsonText, andName: className).generate() else { return }
        
        let attrString = SwiftSyntaxHighlighter(code: modelCode, className: className).highlighted
        attrString <- [AttrTextStyle.courier13]
        
        view.showModel(text: attrString)
    }
    
    func onPasted(json: String) {
        let attrString = JSONSyntaxHighlighter(code: json, className: "").highlighted
        
        view.showJSON(text: attrString)
        
        generateModel(from: json)
    }
    
}
