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
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Remove the startButton
        startButton.runAction(SKAction.removeFromParent())
        
        // Not sure what this does
        super.touchesBegan(touches, withEvent: event)
    }
    
    // Used for animations
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}