//
//  TouchBarController.swift
//  TouchLang
//
//  Created by Виктор Лиханов on 01/02/2019.
//  Copyright © 2019 Виктор Лиханов. All rights reserved.
//

import Cocoa
import CoreFoundation
import Carbon

class TouchBarController: NSObject, NSTouchBarDelegate {
    static let shared = TouchBarController()
    
    var currentTouchBarItem: NSCustomTouchBarItem?
    
    let touchBar = NSTouchBar()
    func setupControlStripPresence() {
        DFRSystemModalShowsCloseBoxWhenFrontMost(false)
        let item = NSCustomTouchBarItem(identifier: .langButton)
        
        
        let source = TISCopyCurrentKeyboardInputSource().takeRetainedValue()
        let value = TISGetInputSourceProperty(source, kTISPropertyInputSourceLanguages)
        if (value != nil) {
            let langKeys = Unmanaged<CFString>.fromOpaque(value!).takeUnretainedValue() as! Array<String>
            if var currentLangKey = langKeys.first {
                if currentLangKey == "en" {
                    currentLangKey = "us"
                }
                let image = NSImage(named: currentLangKey.uppercased())!
                item.view = NSButton(image: image, target: self, action: #selector(presentTouchBar))
                NSTouchBarItem.addSystemTrayItem(item)
                self.currentTouchBarItem = item
                DFRElementSetControlStripPresenceForIdentifier(.langButton, true)
                
            }
        }
    }
    func removeCurrentButton() {
        if let item = self.currentTouchBarItem {
            NSTouchBarItem.removeSystemTrayItem(item)
        }
        
    }
    
    @objc func presentTouchBar() {
        debugPrint("fooBar")
    }
    
}
