//
//  GameScene.swift
//  FlySwipe
//
//  Created by jevon shaw on 12/17/17.
//  Copyright © 2017 jevon shaw. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var paw = SKSpriteNode()
    //var fly = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        paw = self.childNode(withName: "paw") as! SKSpriteNode
        //fly = self.childNode(withName: "fly") as! SKSpriteNode

    }
    
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    func rotatePawBy(thisx: CGFloat, thisy: CGFloat){
        paw.zRotation = atan(thisy / thisx)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            // add if statement to tell if the touch is outside of a certain boundary, then stay in the boundary,
            // but still rotate and move.
            let location = touch.location(in: self)
            paw.run(SKAction.moveTo(x: location.x, duration: 0))
            paw.run(SKAction.moveTo(y: location.y, duration: 0))
            rotatePawBy(thisx: location.x, thisy: location.y)
            //fix the code below. it may be wrong
           /* if abs(location.y) < 480 {
                location.y = 480
            } else {
                
            }*/

        }

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            // add if statement to tell if the touch is outside of a certain boundary, then stay in the boundary,
            // but still rotate and move
            let location = touch.location(in: self)
            paw.run(SKAction.moveTo(x: location.x, duration: 0))
            paw.run(SKAction.moveTo(y: location.y, duration: 0))
            rotatePawBy(thisx: location.x, thisy: location.y)
            //fix the code below. it may be wrong
            //if abs(location.y) < 480 {
                //location.y = 480
            //}
        }

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
