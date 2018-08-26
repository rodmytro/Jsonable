//
//  MainVC.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/24/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import AppKit

class MainVC: BaseVC {

    @IBOutlet var jsonTextView: NSTextView!
    @IBOutlet var modelTextView: NSTextView!
    
    var presenter: MainPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = MainPresenter(view: self)
    }
    
    @IBAction func onConvertClick(_ sender: Any) {
        presenter.generateModel(from: jsonTextView.textStorage!.string)
    }
    
}

extension MainVC: MainMvpView {
    
    func showModel(from attrString: NSAttributedString) {
        modelTextView.textStorage!.setAttributedString(attrString)
    }
    
}
