//
//  GameScene.swift
//  Running screen
//
//  Created by Girls Who Code on 8/2/16.
//  Copyright (c) 2016 Girls Who Code. All rights reserved.
//
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
        
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named:"red-black-gradient.jpg"))
        
        // Making lion appear on screen
        lion.position = CGPoint(x: size.width*0.5, y: size.height*0.0)
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
        var lion_x = constantX
        var lion_y = minY
        var delta_y = 500
        lion.position = CGPoint(x: lion_x, y: lion_y)
//        while lion_y < maxY
//        {
//            lion_y+=1
//            
//            lion.position = CGPoint(x: lion_x, y: lion_y)
//        }
        // Determine speed of the lion
        let actualDuration = CGFloat(5)
//        // Move the lion
//        let actionMove = SKAction.moveTo(CGPoint(x: constantX, y: maxY), duration: NSTimeInterval(actualDuration))
//        //let actionMoveDone = SKAction.unhide()
//        lion.runAction(SKAction.sequence([actionMove]))
        let actionMove = SKAction.moveByX(CGFloat(0), y: CGFloat(delta_y), duration: NSTimeInterval(actualDuration))
        lion.runAction(SKAction.sequence([actionMove]))
        
        func update(currentTime: CFTimeInterval) {
            timer.update()
            print("0")
        }
    }
}