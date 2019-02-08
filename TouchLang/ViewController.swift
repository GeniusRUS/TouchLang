//
//  ViewController.swift
//  TouchLang
//
//  Created by Виктор Лиханов on 26/09/2018.
//  Copyright © 2018 Виктор Лиханов. All rights reserved.
//

import Cocoa
import CoreFoundation
import Carbon

@available(OSX 10.12.1, *)
class ViewController: NSViewController {
    
    @IBOutlet weak var startButton: NSButton!
    
    var disabledButtonTitle = "RunZaloop"
    var enabledButtonTitle = "StopZaloop"

    let daemonManager = DaemonManager()
    
    var isRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.title = disabledButtonTitle
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    @IBAction func startButtonTouched(_ sender: Any) {
        
        if isRunning {
            daemonManager.terminateDaemon()
            startButton.title = disabledButtonTitle
            isRunning = false
        } else {
            daemonManager.runDaemon()
            startButton.title = enabledButtonTitle
            isRunning = true
        }
        
    }
    
    
}
