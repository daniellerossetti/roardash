//
//  GameScene.swift
//  Timer Take 2
//
//  Created by Girls Who Code on 8/3/16.
//  Copyright (c) 2016 Girls Who Code. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    // Setup timer
    let timer = CountdownLabel()
    
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
    }
}