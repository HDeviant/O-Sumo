//
//  GameScene.swift
//  NC1
//
//  Created by Vallen Deviyanto on 20/05/19.
//  Copyright © 2019 Vallen Deviyanto. All rights reserved.
//

import SpriteKit
import GameplayKit

enum BodyType:UInt32{

    case player = 1
    case sumo = 2
}


class GameScene: SKScene, SKPhysicsContactDelegate {
        
//        private var label : SKLabelNode?
//        private var spinnyNode : SKShapeNode?
    
        var thePlayer : SKSpriteNode = SKSpriteNode()
        var theSumo : SKSpriteNode = SKSpriteNode()
        
        override func didMove(to view: SKView) {
            
            if let someSumo : SKSpriteNode = self.childNode(withName: "Sumo") as? SKSpriteNode {
                
                theSumo = someSumo
                theSumo.physicsBody?.isDynamic = true
            }
            
            if let somePlayer : SKSpriteNode = self.childNode(withName: "Player") as? SKSpriteNode {
                
                thePlayer = somePlayer
                thePlayer.physicsBody?.isDynamic = true
                thePlayer.physicsBody?.affectedByGravity = true
                thePlayer.physicsBody?.categoryBitMask = BodyType.player.rawValue
                thePlayer.physicsBody?.collisionBitMask = BodyType.sumo.rawValue
                thePlayer.physicsBody?.contactTestBitMask = BodyType.sumo.rawValue
                
                self.physicsWorld.contactDelegate = self
            }
            for sumo in self.children {
                
                if (sumo.name == "Sumo") {
                    sumo.physicsBody?.categoryBitMask = BodyType.sumo.rawValue
                }
                
            }
            
        }
        
        override func update(_ currentTime: TimeInterval) {
            // Called before each frame is rendered
        }
        
    
        
        func moveUp () {
            
            let movesAction : SKAction = SKAction.moveBy(x: 0, y: 30, duration: 1)
            theSumo.run(movesAction)
            let moveAction : SKAction = SKAction.moveBy(x: 0, y: -30, duration: 1)
            thePlayer.run(moveAction)
            thePlayer.physicsBody?.mass = 1.5
            
            if (self.theSumo.frame.origin.y < 0 && self.theSumo.frame.origin.y > -99) {
                let movesAction : SKAction = SKAction.moveBy(x: 0, y: 10, duration: 1)
                theSumo.run(movesAction)
                let moveAction : SKAction = SKAction.moveBy(x: 0, y: -11, duration: 1)
                thePlayer.run(moveAction)
                thePlayer.physicsBody?.mass = 1
                
            } else if (self.theSumo.frame.origin.y < -100 && self.theSumo.frame.origin.y > -149) {
                let movesAction : SKAction = SKAction.moveBy(x: 0, y: 7.5, duration: 1)
                theSumo.run(movesAction)
                let moveAction : SKAction = SKAction.moveBy(x: 0, y: -8, duration: 1)
                thePlayer.run(moveAction)
                thePlayer.physicsBody?.mass = 1
                
            }
                
            else if (self.theSumo.frame.origin.y < -150 && self.theSumo.frame.origin.y > -329) {
                let movesAction : SKAction = SKAction.moveBy(x: 0, y: 5, duration: 1)
                theSumo.run(movesAction)
                let moveAction : SKAction = SKAction.moveBy(x: 0, y: -5.1, duration: 1)
                thePlayer.run(moveAction)
                thePlayer.physicsBody?.mass = 1
            }
            else if (self.theSumo.frame.origin.y < -350) {
                let movesAction : SKAction = SKAction.moveBy(x: 0, y: 2000, duration: 5)
                theSumo.run(movesAction)
                thePlayer.physicsBody?.mass = 0.1
                
            } else if (self.thePlayer.frame.origin.y > 0) {
                let movesAction : SKAction = SKAction.moveBy(x: 0, y: -40, duration: 1)
                thePlayer.run(movesAction)
                theSumo.physicsBody?.mass = 0.1
                
            }
        }
    
//    func moveDown() {
//        let moveAction : SKAction = SKAction.moveBy(x: 0, y: 10, duration: 1)
//        theSumo.run(moveAction)
//    }
    
    func moveSumo() {
        let moveAction : SKAction = SKAction.moveBy(x: 0, y: 30, duration: 1)
        theSumo.run(moveAction)
    }
    
    func movePlayer() {
        let moveAction : SKAction = SKAction.moveBy(x: 0, y: 30, duration: 1)
        thePlayer.run(moveAction)
    }
    
    
        func touchDown(atPoint pos : CGPoint) {
            
            if (pos.y > -650) {
                moveUp()
//                moveDown()
                
            }
            
        }
    
  
    
    
        
        func touchMoved(toPoint pos : CGPoint) {
            
        }
        
        func touchUp(atPoint pos : CGPoint) {
            
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            for t in touches { self.touchDown(atPoint: t.location(in: self)) }
//            let movesAction : SKAction = SKAction.moveBy(x: 0, y: 100, duration: 1)
//            theSumo.run(movesAction)
//            let moveAction : SKAction = SKAction.moveBy(x: 0, y: -100, duration: 1)
//            thePlayer.run(moveAction)
        }
        
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
        }
        
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            for t in touches { self.touchUp(atPoint: t.location(in: self)) }
        }
        
        override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
            for t in touches { self.touchUp(atPoint: t.location(in: self)) }
        }
        
    func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.categoryBitMask == BodyType.player.rawValue && contact.bodyB.collisionBitMask == BodyType.sumo.rawValue) {
            print("push")
        }
    }
        
}
