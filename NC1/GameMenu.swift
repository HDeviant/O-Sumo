//
//  GameMenu.swift
//  NC1
//
//  Created by Vallen Deviyanto on 26/05/19.
//  Copyright © 2019 Vallen Deviyanto. All rights reserved.
//

import Foundation
import SpriteKit

class GameMenu: SKScene{
    
    var oSumo = SKLabelNode()
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        oSumo = self.childNode(withName: "O-Sumo") as! SKLabelNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            if atPoint(touchLocation).name == "O-Sumo" {
                let gameScene = SKScene(fileNamed: "GameScene")!
                gameScene.scaleMode = .aspectFill
                view?.presentScene(gameScene, transition: SKTransition.doorsOpenVertical(withDuration: TimeInterval (1)))
                
            }
        }
    }
}
