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
    var xreach: CGFloat = 250
    var yreach: CGFloat = 480
    var boundary = SKSpriteNode()
    var paw = SKSpriteNode()
    var gameTimer:Timer!
    
    //game timer? font size, font name, font color, pythagorean thm to calc distance.
    
    override func didMove(to view: SKView) {
        /*
        boundary = self.childNode(withName: "boundary") as! SKSpriteNode
        boundary.position = CGPoint(x: 0.0, y: 0.0)
 */
        paw = self.childNode(withName: "paw") as! SKSpriteNode
        paw.position = CGPoint(x: 0.0, y: -480)
        paw.anchorPoint = CGPoint(x: 0.5, y: 0.8)
        paw.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: paw.size.width, height: paw.size.height/3))
        paw.physicsBody?.affectedByGravity = false
        paw.physicsBody?.linearDamping = 15
        let orConstraint = SKConstraint.orient(to: CGPoint(x: 0.0, y: 0.0), offset: SKRange(constantValue: (3 * CGFloat.pi / 2)))
        paw.constraints = [orConstraint]
        gameTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(addFly), userInfo: nil, repeats: true)

    }
    
    
    @objc func addFly() {
        
        //initialize fly parameters
        let fly = SKSpriteNode(imageNamed: "fly")
        let randomPos = GKRandomDistribution(lowestValue: -320, highestValue: 320)
        let flyPos = CGPoint(x: randomPos.nextInt(), y: -200)
        fly.physicsBody = SKPhysicsBody(rectangleOf: fly.size)
        fly.physicsBody?.isDynamic = true
        fly.physicsBody?.friction = 0
        fly.physicsBody?.affectedByGravity = false
        fly.position = flyPos
        self.addChild(fly)
        
        //fly velocity setter
        func setFlyVel(delx: CGFloat, dely: CGFloat){
            fly.physicsBody?.velocity = CGVector(dx: delx, dy: dely)
        }
        setFlyVel(delx: -200.0, dely: 462.0)
        
        //if the fly goes off the screen, delete it
        if abs(fly.position.x) > 400 || abs(fly.position.y) > 650{
            fly.removeFromParent()
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            paw.run(SKAction.moveTo(x: location.x, duration: 0)) // move to whatever point is touched
            paw.run(SKAction.moveTo(y: location.y, duration: 0))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            paw.run(SKAction.moveTo(x: location.x, duration: 0)) // move to wherever the touch is moved to
            paw.run(SKAction.moveTo(y: location.y, duration: 0))
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
