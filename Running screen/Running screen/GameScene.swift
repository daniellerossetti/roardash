//
//  GameScene.swift
//  Running screen
//
//  Created by Girls Who Code on 8/2/16.
//  Copyright (c) 2016 Girls Who Code. All rights reserved.
//
// Created Day 2 to animate lion icon. Displays the user icon at the top of the screen and the lion at the bottom; the lion moves to the center of the creen using the moveTo() function.

import SpriteKit

class GameScene: SKScene {
    // Setup timer
    let timer = CountdownLabel()
    // Creating lion & user
    let lion = SKSpriteNode(imageNamed: "lion_icon")
    let user = SKSpriteNode(imageNamed: "user_icon")
    
    // Random positions & arcs (Kept if we need it in the future)
//    func random() -> CGFloat {
//        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
//    }
    
//    func random(min min: CGFloat, max: CGFloat) -> CGFloat {
//        return random() * (max - min) + min
//    }
    
    // Main animation displays automatically when app runs
    override func didMoveToView(view: SKView) {
        // Create, position, and start the timer when the game moves to view
        let timerPosition = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame))
        timer.position = timerPosition
        timer.fontSize = 35;
        addChild(timer)
        timer.startWithDuration(20)
        
        func update(currentTime: CFTimeInterval) {
            timer.update()
        }
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named:"red-black-gradient.jpg"))
        
        // Making lion appear on screen
        // Setting initial position of lion
        lion.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        // Making lion appear
        addChild(lion)
        
        // Making user appear on screen
        // Set position
        user.position = CGPoint(x: size.width * 0.5, y: size.height * 0.9)
        // Making user appear
        addChild(user)
        
        // Animating lion
        // Setting constant x
        let constantX = size.width * 0.5
        //Setting boundaries for Y position
        let minY = CGFloat(0.0)
        let maxY = size.height * 0.5
        
        // Position the lion at the bottom of the screen
        lion.position = CGPoint(x: constantX, y: minY)
        // Determine speed of the lion
        let actualDuration = CGFloat(3.0)
        // Move the lion
        let actionMove = SKAction.moveTo(CGPoint(x: constantX, y: maxY), duration: NSTimeInterval(actualDuration))
        //let actionMoveDone = SKAction.unhide()
        lion.runAction(SKAction.sequence([actionMove]))
    }
}