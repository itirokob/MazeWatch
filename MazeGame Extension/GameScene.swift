//
//  GameScene.swift
//  MazeGame Extension
//
//  Created by Bianca Itiroko on 18/06/18.
//  Copyright © 2018 Bianca Itiroko. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene {
    let manager = CMMotionManager()
//    var player = SKSpriteNode()
//    var endNode = SKSpriteNode()
    
    override func sceneDidLoad() {
        self.physicsWorld.contactDelegate = (self as? SKPhysicsContactDelegate)
        
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.1
        manager.startAccelerometerUpdates(to: OperationQueue.main){
            (data, error) in
            self.physicsWorld.gravity = CGVector(dx: CGFloat((data?.acceleration.x)!) * 10, dy: CGFloat((data?.acceleration.y)!) * 10)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
