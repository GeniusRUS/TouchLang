//
//  main.swift
//  TouchLangDaemon
//
//  Created by Виктор Лиханов on 08/02/2019.
//  Copyright © 2019 Виктор Лиханов. All rights reserved.
//

import Foundation

if #available(OSX 10.12.2, *) {
    
    let observer = LanguageChangeObserver()
    observer.startObserving()
    
    NSApplication.shared.isAutomaticCustomizeTouchBarMenuItemEnabled = true
    
    TouchBarController.shared.setupControlStripPresence()
}



