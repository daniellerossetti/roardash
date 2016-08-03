//
//  ViewController.swift
//  Running Screen Single View
//
//  Created by Girls Who Code on 8/3/16.
//  Copyright © 2016 Girls Who Code. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let lion = SKSpriteNode(imageNamed: "lion_icon")
        let user = SKSpriteNode(imageNamed: "user_icon")
        
        // Random positions & arcs (Kept if we need it in the future)
        //    func random() -> CGFloat {
        //        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
        //    }
        
        //    func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        //        return random() * (max - min) + min
        //    }
        
        //Main animation
        
        func didMoveToView(view: SKView) {
            
            //self.view.backgroundColor = UIColor(patternImage: UIImage(named:"red-black-gradient.jpg"))
            
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
            
        }

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    

}



