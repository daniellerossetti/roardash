//
//  GameScene.swift
//  Running screen
//
//  Created by Girls Who Code on 8/2/16.
//  Copyright (c) 2016 Girls Who Code. All rights reserved.
//
// Created Day 2 to animate lion icon. Displays the user icon at the top of the screen and the lion at the bottom; the lion moves to the center of the creen using the moveTo() function.
// I updated it to use moveByX() so I believe it is now current

import SpriteKit

class GameScene: SKScene {
    // Creating lion & user
    let lion = SKSpriteNode(imageNamed: "lion_icon")
    let user = SKSpriteNode(imageNamed: "user_icon")
    
    // Main animation displays automatically when app runs
    override func didMoveToView(view: SKView) {
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
        
        // Parameter for animating lion
        // Position the lion at the bottom of the screen
        var lion_x = size.width * 0.5
        var lion_y = CGFloat(0.0)
        var delta_y = 500
        lion.position = CGPoint(x: lion_x, y: lion_y)
        
        // Determine speed of the lion
        let actualDuration = CGFloat(5)
        
        // Animate the lion
        let actionMove = SKAction.moveByX(CGFloat(0), y: CGFloat(delta_y), duration: NSTimeInterval(actualDuration))
        lion.runAction(SKAction.sequence([actionMove]))
    }
}