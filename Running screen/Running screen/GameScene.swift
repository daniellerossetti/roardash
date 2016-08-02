//
//  GameScene.swift
//  Running screen
//
//  Created by Girls Who Code on 8/2/16.
//  Copyright (c) 2016 Girls Who Code. All rights reserved.
//
import SpriteKit

class GameScene: SKScene {
    
    // setting player to lion icon
    let player = SKSpriteNode(imageNamed: "lion_icon")
    let user = SKSpriteNode(imageNamed: "user_icon")
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    override func didMoveToView(view: SKView) {
        // Making lion appear on screen
        // Setting background color
        backgroundColor = SKColor.whiteColor()
        // Setting initial position of lion
        player.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        // Making lion appear
        addChild(player)
        
        // Making user appear on screen
        // Set position
        user.position = CGPoint(x: size.width * 0.5, y: size.height * 0.9)
        // Making lion appear
        addChild(user)
        
        // Animating lion
        // Determine where to spawn the player along the Y axis
        let constantX = size.width * 0.5
        let minY = CGFloat(0.0)
        let maxY = size.height/2
        //let constantX = random(min: player.size.width/2, max: size.width - player.size.width/2)
        // Position the player slightly off-screen along the right edge, and along a random position along the Y axis as calculated above
        player.position = CGPoint(x: constantX, y: minY)
        // Determine speed of the player
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
        // Create the actions
        let actionMove = SKAction.moveTo(CGPoint(x: constantX, y: maxY), duration: NSTimeInterval(actualDuration))
        let actionMoveDone = SKAction.unhide()
        player.runAction(SKAction.sequence([actionMove, actionMoveDone]))
    }
}

//import SpriteKit
//
//class GameScene: SKScene {
//    override func didMoveToView(view: SKView) {
//        /* Setup your scene here */
//        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
//        myLabel.text = "Hello, World!"
//        myLabel.fontSize = 45
//        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
//        
//        self.addChild(myLabel)
//    }
//    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//       /* Called when a touch begins */
//        
//        for touch in touches {
//            let location = touch.locationInNode(self)
//            
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
//            
//            sprite.xScale = 0.5
//            sprite.yScale = 0.5
//            sprite.position = location
//            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            
//            sprite.runAction(SKAction.repeatActionForever(action))
//            
//            self.addChild(sprite)
//        }
//    }
//   
//    override func update(currentTime: CFTimeInterval) {
//        /* Called before each frame is rendered */
//    }
//}
