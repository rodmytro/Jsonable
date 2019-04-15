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
        
        setupStyle()
        setupPasteActions()
    }
    
    private func setupStyle() {
        jsonTextView <- [TextStyle.bgrDarkGrey, TextStyle.textWhite, Style.appearanceAqua]
        modelTextView <- [TextStyle.bgrDarkGrey, TextStyle.textWhite, Style.appearanceAqua]
//        convertButton <- [Style.buttonGradient]
    }
    
    private func setupPasteActions() {
        jsonTextView.pasteCallback = { [weak self] in
            self?.presenter.onPasted(json: self?.jsonTextView.textStorage?.string)
        }
    }
    
    // MARK: actions
    @IBAction func onConvertClick(_ sender: Any) {
        presenter.onConvertClick(from: jsonTextView.textStorage!.string)
    }
    
    @IBAction func onCopyClick(_ sender: Any) {
        presenter.onCopyClick()
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
