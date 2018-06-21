//
//  ConnectivityInterfaceController.swift
//  MazeGame Extension
//
//  Created by Bianca Itiroko on 21/06/18.
//  Copyright © 2018 Bianca Itiroko. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class ConnectivityInterfaceController: WKInterfaceController, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}

    let userDefaults = UserDefaults.standard
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if(WCSession.isSupported()){
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        
        self.userDefaults.set(1, forKey: "maxLevelReached")

        // Configure interface objects here.
    }
    @IBAction func sendHiToiOS() {
        let newLevel = self.userDefaults.integer(forKey: "maxLevelReached") + 1
        self.userDefaults.set(newLevel, forKey: "maxLevelReached")
        
        if(WCSession.default.isReachable){
            let message = ["maxLevelReached": newLevel]
            WCSession.default.sendMessage(message, replyHandler: nil)
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
