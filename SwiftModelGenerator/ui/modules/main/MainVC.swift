//
//  MainVC.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/24/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import AppKit

class MainVC: BaseVC {

    @IBOutlet var jsonTextView: PastableTextView!
    @IBOutlet var modelTextView: NSTextView!
    @IBOutlet weak var convertButton: NSButton!
    @IBOutlet weak var copyButton: NSButton!
    
    var presenter: MainPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = MainPresenter(view: self)
        
        style()
        
        jsonTextView.pasteCallback = { [weak self] in 
            guard let strongSelf = self else { return }
            
            strongSelf.presenter.onPasted(json: strongSelf.jsonTextView.textStorage!.string)
        }
    }
    
    func style() {
        jsonTextView <- [TextStyle.bgrDarkGrey, TextStyle.textWhite, Style.appearanceAqua]
        modelTextView <- [TextStyle.bgrDarkGrey, TextStyle.textWhite, Style.appearanceAqua]
        convertButton <- [Style.buttonGradient]
    }
    
    @IBAction func onConvertClick(_ sender: Any) {
        presenter.generateModel(from: jsonTextView.textStorage!.string)
    }
    
    @IBAction func onCopyClick(_ sender: Any) {
        
    }
}

extension MainVC: MainMvpView {
    
    func showModel(text attrString: NSMutableAttributedString) {
        modelTextView.textStorage!.setAttributedString(attrString)
    }
    
    func showJSON(text attrString: NSMutableAttributedString) {
        jsonTextView.textStorage?.setAttributedString(attrString)
    }
}
