//
//  CountdownLabel.swift
//  Running screen
//
//  Created by Girls Who Code on 8/3/16.
//  Copyright © 2016 Girls Who Code. All rights reserved.
//
// Tutorial from http://tutorials.tinyappco.com/SwiftGames/Timer

import SpriteKit
class CountdownLabel: SKLabelNode {
    var endTime:NSDate!
    
        private func timeLeft() -> NSTimeInterval {
        let now = NSDate();
        let remainingSeconds = endTime.timeIntervalSinceDate(now)
        return max(remainingSeconds, 0)
    }
}


