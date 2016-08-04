
//
//  GameScene.swift
//  Rowan Start Button Game
//
//  Created by Girls Who Code on 8/3/16.
//  Copyright (c) 2016 Girls Who Code. All rights reserved.
//

// This file opens a screen with a start button
// The user can click anywhere and the text will hide and the running screen will show up
// I coded this before we learned about how to use storyboard and it is now irrelevant

import SpriteKit

class GameScene: SKScene {

    // All functions below recognize startButton
    let startButton = SKLabelNode()
    // Creating lion & user
    let lion = SKSpriteNode(imageNamed: "lion_icon")
    let user = SKSpriteNode(imageNamed: "user_icon")
    
    // Automatically show startButton when screen moves to view
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        // Not working for some reason
        self.view!.backgroundColor = UIColor.blackColor()

        // Parameters to determine visual display
        startButton.text = "Touch anywhere to start"
        startButton.position = CGPoint(x: size.width * 0.5, y: size.height * 0.3)

        // Make the startButton show up
        addChild(startButton)
        
    }
    
    // Runs when the screen is tapped anywhere
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Remove the startButton
        startButton.runAction(SKAction.removeFromParent())
        
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
        
        // Parameter for nimating lion
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
        
        // Not sure what this does
        super.touchesBegan(touches, withEvent: event)
    }
    
    // Used for animations
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}