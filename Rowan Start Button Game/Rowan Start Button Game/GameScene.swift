//
//  GameScene.swift
//  Rowan Start Button Game
//
//  Created by Girls Who Code on 8/3/16.
//  Copyright (c) 2016 Girls Who Code. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    let startButton = SKLabelNode()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        startButton.text = "Start"
        startButton.position = CGPoint(x: size.width * 0.5, y: size.height * 0.3)

        addChild(startButton)
        
        let itemHide = SKAction.removeFromParent()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("click")
        startButton.runAction(SKAction.removeFromParent())
        
//        super.touchesBegan(touches, withEvent: event)
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}