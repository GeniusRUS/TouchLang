//
//  DaemonManager.swift
//  TouchLangDaemon
//
//  Created by Виктор Лиханов on 08/02/2019.
//  Copyright © 2019 Виктор Лиханов. All rights reserved.
//

import Foundation

class DaemonManager {
    
    func runDaemon() {
        
        let url = Bundle.main.bundleURL.appendingPathComponent("/Contents/Resources/TouchLangDaemon")
        do {
            try Process.run(url, arguments: [], terminationHandler: nil)
        } catch {
            debugPrint(error)
        }
    }
    
    func terminateDaemon() {
        if let daemon = NSWorkspace.shared.runningApplications.first(where: ({$0.localizedName == "TouchLangDaemon"})) {
            daemon.terminate()
        }
        
    }
}
