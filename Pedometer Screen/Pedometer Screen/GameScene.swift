//
//  GameScene.swift
//  Pedometer Screen
//
//  Created by Girls Who Code on 8/2/16.
//  Copyright (c) 2016 Girls Who Code. All rights reserved.
//

import SpriteKit
import HealthKit
import CoreMotion

class GameScene: SKScene {
    let pedometer = CMPedometer()

    func startPedometerUpdatesFromDate(start: NSDate,
                                           withHandler handler: CMPedometerHandler) {}
    //self updateLabels:pedometerData
    
    func stopPedometerUpdates() {}
    
}