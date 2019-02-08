//
//  LanguageChangeObserver.swift
//  TouchLangDaemon
//
//  Created by Виктор Лиханов on 08/02/2019.
//  Copyright © 2019 Виктор Лиханов. All rights reserved.
//

import Foundation

class LanguageChangeObserver {
    
    func startObserving() {
        NotificationCenter.default.addObserver(self, selector: #selector(languageDidSet), name: NSNotification.Name(rawValue: "NSTextInputContextKeyboardSelectionDidChangeNotification"), object: nil)
    }
    
   
    @objc func languageDidSet() {
        TouchBarController.shared.removeCurrentButton()
        TouchBarController.shared.setupControlStripPresence()
        debugPrint("language changed")
    }
}
