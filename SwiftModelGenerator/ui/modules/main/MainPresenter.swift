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
        guard let modelCode = ModelService(from: jsonText, andName: "MyClass").generate() else { return }
        
        let attrString = SwiftSyntaxHighlighter(code: modelCode).highlighted
        attrString <- [AttrTextStyle.courier12]
        
        view.showModel(text: attrString)
    }
    
}
