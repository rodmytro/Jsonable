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
    @IBOutlet weak var convertButton: NSButton!
    
    var presenter: MainPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = MainPresenter(view: self)
        
        style()
    }
    
    func style() {
        jsonTextView <- [TextStyle.bgrDarkGrey, TextStyle.textWhite, Style.appearanceAqua]
        modelTextView <- [TextStyle.bgrDarkGrey, TextStyle.textWhite, Style.appearanceAqua]
        convertButton <- [Style.buttonGradient]
    }
    
    @IBAction func onConvertClick(_ sender: Any) {
        presenter.generateModel(from: jsonTextView.textStorage!.string)
    }
    
}

extension MainVC: MainMvpView {
    
    func showModel(text attrString: NSMutableAttributedString) {
        attrString <- [AttrTextStyle.colorWhite]
        
        modelTextView.textStorage!.setAttributedString(attrString)
    }
    
}
