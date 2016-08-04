//
//  SWViewController.swift
//  SimpleStopDemo
//
//  Created by Ravi Shankar on 22/07/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

import UIKit

class SWViewController: UIViewController {
    
    // Connects time label to code
    @IBOutlet var displayTimeLabel: UILabel!
    
    // Stores time that start button is pressed
    var startTime = NSTimeInterval()
    var totalElapsedTime: NSTimeInterval = 0;
    var timer:NSTimer = NSTimer()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func start(sender: AnyObject) {
        if (!timer.valid) {
            let aSelector : Selector = #selector(SWViewController.updateTime)
            // Parameters for timer
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: aSelector, userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate()
        }
        
    }
    
    @IBAction func pause(sender: AnyObject) {
        // Do something to pause app
        // We are still working on this
    }
    
    @IBAction func stop(sender: AnyObject) {
        timer.invalidate()
        
    }
    
    func updateTime() {
//        // Time at which timer updates
//        let currentTime = NSDate.timeIntervalSinceReferenceDate()
//        
//        // Find the difference between current time and start time.
//        let elapsedTime: NSTimeInterval = currentTime - startTime
//        
//        totalElapsedTime += elapsedTime
//
//        let formatter = NSDateFormatter()
//        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
//        formatter.dateFormat = "mm:ss"
//
//        let date = NSDate(timeIntervalSinceReferenceDate: totalElapsedTime)
//        displayTimeLabel.text = formatter.stringFromDate(date)
        
         Calculate the minutes in elapsed time.
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        
        // Calculate the seconds in elapsed time.
        let seconds = UInt8(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        
        // Find out the fraction of milliseconds to be displayed.
        let fraction = UInt8(elapsedTime * 100)
        
        // Add the leading zero for minutes, seconds and millseconds and store them as string constants
        
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strFraction = String(format: "%02d", fraction)
        
        // Concatenate minutes, seconds and milliseconds as assign it to the UILabel
        displayTimeLabel.text = "\(strMinutes):\(strSeconds):\(strFraction)"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
