//
//  GameScene.swift
//  Rowan Start Button Game
//
//  Created by Girls Who Code on 8/3/16.
//  Copyright (c) 2016 Girls Who Code. All rights reserved.
//

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
        // Parameters to determine visual display
        startButton.text = "Start"
        startButton.position = CGPoint(x: size.width * 0.5, y: size.height * 0.3)

        // Make the startButton show up
        addChild(startButton)
        
    }
    
    // Runs when the screen is tapped anywhere
    // The lion animation is contained within this function
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
        
        // Not sure what this does
        super.touchesBegan(touches, withEvent: event)
    }
    
    // Used for animations
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}