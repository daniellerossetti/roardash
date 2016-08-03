//
//  ViewController.swift
//  Timer-Attempt
//
//  Created by Girls Who Code on 8/2/16.
//  Copyright © 2016 Girls Who Code. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Refers to the connection between the label that shows the time & the code
    @IBOutlet var countingLabel: UILabel!
    
    //initial set-up of variables
    //creating a timer
    var startTime = NSTimeInterval()
    var timer = NSTimer()
    //defining our counter
    var counter = 0
    
    func updateCounter() {
        countingLabel.text=String(counter+=1)
    }
    
    //links the start button to the timer
    @IBAction func startTimer(sender: AnyObject)
    {
        /*
         1 = Time increment 
         updateCounter = function that is triggered when we start the timer
         true = this function will repeat itself until the timer is invalidated/stops
         */
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting the timer's text to the current time (counter)
        countingLabel.text = String(counter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    


}

