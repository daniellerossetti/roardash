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
    
    override func didMoveToView(view: SKView) {
        // setting background color
        backgroundColor = SKColor.whiteColor()
        // setting initial position of lion
        player.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        // making lion appear 
        addChild(player)
    }
    
    func moveIcon() {
        let actualDuration = 2
        let actionMove = SKAction.moveTo(CGPoint(x: size.width * 0.5, y: size.height * 0.3), duration: NSTimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
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
