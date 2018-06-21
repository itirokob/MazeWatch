//
//  ViewController.swift
//  MazeWatch
//
//  Created by Bianca Itiroko on 18/06/18.
//  Copyright © 2018 Bianca Itiroko. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}
    func sessionDidBecomeInactive(_ session: WCSession) {}
    func sessionDidDeactivate(_ session: WCSession) {}
    
    @IBOutlet weak var textLabel: UILabel!
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        if let message = message["maxLevelReached"] as? Int{
            self.userDefaults.set(message, forKey: "maxLevelReached")
            
            DispatchQueue.main.async {
                self.textLabel.text = "Max level is " + String(self.userDefaults.integer(forKey: "maxLevelReached"))
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

