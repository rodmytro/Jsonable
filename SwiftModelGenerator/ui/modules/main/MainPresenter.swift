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
        let className = "MyClass" //classNameTextField.stringValue.isEmpty ? "MyClass":classNameTextField.stringValue;
        
        guard let jsonData = jsonText.data(using: .utf8),
            let dir = jsonData.dictionary else {
            view.showModel(text: NSMutableAttributedString(string: "Couldn't encode your data..."))
            return
        }
        
        let json = JSON(dir)
        let generator = ModelGenerator(from: json, andName: className)
        let attrString = NSMutableAttributedString(string: generator.output)
        
        view.showModel(text: attrString)
    }
    
}
