
//
//  GameScene.swift
//  Rowan Start Button Game
//
//  Created by Girls Who Code on 8/3/16.
//  Copyright (c) 2016 Girls Who Code. All rights reserved.
//

// This file opens a screen with a start button
// The user can click anywhere and the text will hide and the running screen will show up
import SpriteKit

//class GameScene: SKScene {
//    
//    // All functions below recognize startButton
//    let startButton = SKLabelNode()
//    // Creating lion & user
//    let lion = SKSpriteNode(imageNamed: "lion_icon")
//    let user = SKSpriteNode(imageNamed: "user_icon")
//    
//    // Automatically show startButton when screen moves to view
//    override func didMoveToView(view: SKView) {
//        /* Setup your scene here */
//        // Not working for some reason
//        self.view!.backgroundColor = UIColor.blackColor()
//        
//        // Parameters to determine visual display
//        startButton.text = "Start"
//        startButton.position = CGPoint(x: size.width * 0.5, y: size.height * 0.3)
//        
//        // Make the startButton show up
//        addChild(startButton)
//    }
//}

class GameScene: SKScene {
    // All functions below recognize startButton
    let startLabel = SKLabelNode()
    var startButton: SKNode! = nil
    // Creating lion & user
    let lion = SKSpriteNode(imageNamed: "lion_icon")
    let user = SKSpriteNode(imageNamed: "user_icon")
        
    override func didMoveToView(view: SKView) {
        startButton = SKSpriteNode(color: SKColor.redColor(), size: CGSize(width:100, height:44))
            // Parameters to determine visual display
            startButton.position = CGPoint(x: size.width * 0.5, y: size.height * 0.3)
            // Parameters to determine visual display
            startLabel.text = "Start"
            startLabel.position = CGPoint(x: size.width * 0.5, y: size.height * 0.3)
            self.addChild(startButton)
            self.addChild(startLabel)
        }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

//            print("touchesEnded")
//            // Loops for every touch
//            for touch:AnyObject in touches {
//                // Checks if touch was on startButton
//                let location = touch.locationInNode(startButton)
//                if startButton.containsPoint(location) {
                    print("start activated")
                    // Animating lion
                    self.addChild(lion)
                    self.addChild(user)
                    // Setting constant x
                    let constantX = size.width * 0.5
                    //Setting boundaries for Y position
                    let minY = CGFloat(0.0)
                    let maxY = size.height * 0.5
                    
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
                //}
            
    //}
}
}

/*
     I removed the contents of this function because we no longer want the animation to play after you tap anywhere on the screen but rather when this screen loads. The above function didMovetoView indicates that you've switched to the running screen, so the animation plays. You can delete the commented code below if you like! - Shreya 
 */
//    // Runs when the screen is tapped anywhere
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        // Remove the startButton
//        startButton.runAction(SKAction.removeFromParent())
//        
//        // Making lion appear on screen
//        // Setting initial position of lion
//        lion.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
//        // Making lion appear
//        addChild(lion)
//        
//        // Making user appear on screen
//        // Set position
//        user.position = CGPoint(x: size.width * 0.5, y: size.height * 0.9)
//        // Making user appear
//        addChild(user)
//        
//        // Parameter for nimating lion
//        // Position the lion at the bottom of the screen
//        var lion_x = size.width * 0.5
//        var lion_y = CGFloat(0.0)
//        var delta_y = 500
//        lion.position = CGPoint(x: lion_x, y: lion_y)
//        
//        // Determine speed of the lion
//        let actualDuration = CGFloat(5)
//        
//        // Animate the lion
//        let actionMove = SKAction.moveByX(CGFloat(0), y: CGFloat(delta_y), duration: NSTimeInterval(actualDuration))
//        lion.runAction(SKAction.sequence([actionMove]))
//        
//        // Not sure what this does
//        super.touchesBegan(touches, withEvent: event)
//    }
    
//    // Used for animations
//    override func update(currentTime: CFTimeInterval) {
//        /* Called before each frame is rendered */
//    }