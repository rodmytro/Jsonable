//
//  MainVC.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/24/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Cocoa

class MainVC: BaseVC {

    @IBOutlet var jsonTextView: NSTextView!
    @IBOutlet var modelTextView: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func onConvertClick(_ sender: Any) {
        generateModel()
    }
    
    func generateModel() {
        let className = "MyClass" //classNameTextField.stringValue.isEmpty ? "MyClass":classNameTextField.stringValue;
        
        let jsonText = jsonTextView.textStorage!.string
        let jsonData = jsonText.data(using: .utf8)
        
        
        if let jsonData = jsonData {
            if let dir = convertToDictionary(data: jsonData) {
                
                let json = JSON(dir)
                
                let generator = ModelGenerator(json: json, className: className, inspectArrays: true)
                
                modelTextView.textStorage!.setAttributedString(NSAttributedString(string: generator.output))
            }
            
        } else {
            modelTextView.textStorage!.setAttributedString(NSAttributedString(string: "Couldn't encode your data..."))
        }
    }
    
    func convertToDictionary(data: Data) -> [String: AnyObject]? {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String : AnyObject]
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
        
        return nil
    }
    
}
