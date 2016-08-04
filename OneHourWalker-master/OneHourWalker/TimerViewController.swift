//
//  TimerViewController.swift
//  OneHourWalker
//
//  Created by Matthew Maher on 2/18/16.
//  Copyright © 2016 Matt Maher. All rights reserved.
//
// This file has time, distance, and sharing capabilities. The share and height features that use HealthKit have been diabled. When run on the computer, it simulates a person walking at a constant pace. Pressing go after stop has been used clears the timer (no pause).

import UIKit
import CoreLocation
//import HealthKit

class TimerViewController: UIViewController, CLLocationManagerDelegate {
    // References that can be reset, or mutable variables (I know I'm gettin gthe terminology wrong)
    // Sets up the text to display for time and distance
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var milesLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    // zeroTime is a time interval that will be set to the time at which start is pressed. The timer is declared here
    var zeroTime = NSTimeInterval()
    var timer : NSTimer = NSTimer()
    
    // This project uses locationManager to track GPS location and distance
    let locationManager = CLLocationManager()
    var startLocation: CLLocation!
    var lastLocation: CLLocation!
    // Give variables starting files when start is called
    var distanceTraveled = 0.0
    var timerStartDate: NSDate!
    
//    let healthManager:HealthKitManager = HealthKitManager()
//    var height: HKQuantitySample?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Pop-up request for user to allow locatin services
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            // If user allows location services, call the locationManager to deliver location
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        } else {
            // An error message
            print("Need to Enable Location")
        }
        
        // We cannot access the user's HealthKit data without specific permission.
//        getHealthKitPermission()
    }

    // Get rid of unnecessary stuff
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
//    func getHealthKitPermission() {
//        
//        // Seek authorization in HealthKitManager.swift.
//        healthManager.authorizeHealthKit { (authorized,  error) -> Void in
//            if authorized {
//                
//                // Get and set the user's height.
//                self.setHeight()
//            } else {
//                if error != nil {
//                    print(error)
//                }
//                print("Permission denied.")
//            }
//        }
//    }
    
    // When start button is tapped do these actions
    @IBAction func startTimer(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
        zeroTime = NSDate.timeIntervalSinceReferenceDate()
        
        // Set the initial values again so that distance doesn't jump up to wrong number
        distanceTraveled = 0.0
        startLocation = nil
        lastLocation = nil
        timerStartDate = NSDate()
        
        locationManager.startUpdatingLocation()
    }
    
    // Stop updating when stop button is pressed
    @IBAction func stopTimer(sender: AnyObject) {
        timer.invalidate()
        locationManager.stopUpdatingLocation()
    }
    
    // The process of updating the timer
    func updateTime() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        var timePassed: NSTimeInterval = currentTime - zeroTime
        
        // Divide time passed by 60 (conversion factor from seconds to minutes) and subtract that value so as not to double-count this time
        let minutes = UInt8(timePassed / 60.0)
        timePassed -= (NSTimeInterval(minutes) * 60)
        // Do the same conversion for seconds
        let seconds = UInt8(timePassed)
        timePassed -= NSTimeInterval(seconds)
        // Convert remaining increase in time to milliseconds
        let millisecsX10 = UInt8(timePassed * 100)
        
        // Format the values of each time componen
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strMSX10 = String(format: "%02d", millisecsX10)
        
        // Display the components (min, sec, millisec) as a stopwatch
        timerLabel.text = "\(strMinutes):\(strSeconds):\(strMSX10)"
        
        // Kill the timer if it runs over the maximum value
        if timerLabel.text == "60:00:00" {
            timer.invalidate()
            locationManager.stopUpdatingLocation()
        }
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("locations: \(locations)")
        
        let currentLocation = locations.last!
        
        if currentLocation.timestamp.compare(timerStartDate) == NSComparisonResult.OrderedAscending  {
            print("location was recorded before we started the timer, ignoring...")
            return
        }
        
        
        if startLocation == nil {
            // If the startLocation box is empty when locationManager function is called, fill it with the current location
            startLocation = currentLocation
        } else {
            // If the function has already been called, calculate distance travelled
            let lastDistance = lastLocation.distanceFromLocation(currentLocation)
            distanceTraveled += lastDistance * 0.000621371
            
            //        Why format: "%.2f" and trimmedDistance?
            let trimmedDistance = String(format: "%.2f", distanceTraveled)
            
            // Display the distance travelled
            milesLabel.text = "\(trimmedDistance) Miles"
        }
        
        // Update the lastLocation value for next time loop runs
        lastLocation = currentLocation
    }
    
//    func setHeight() {
//        // Create the HKSample for Height.
//        let heightSample = HKSampleType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight)
//        
//        // Call HealthKitManager's getSample() method to get the user's height.
//        self.healthManager.getHeight(heightSample!, completion: { (userHeight, error) -> Void in
//            
//            if( error != nil ) {
//                print("Error: \(error.localizedDescription)")
//                return
//            }
//            
//            var heightString = ""
//            
//            self.height = userHeight as? HKQuantitySample
//            
//            // The height is formatted to the user's locale.
//            if let meters = self.height?.quantity.doubleValueForUnit(HKUnit.meterUnit()) {
//                let formatHeight = NSLengthFormatter()
//                formatHeight.forPersonHeightUse = true
//                heightString = formatHeight.stringFromMeters(meters)
//            }
//            
//            // Set the label to reflect the user's height.
//            dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                self.heightLabel.text = heightString
//            })
//        })
//        
//    }
//    
//    @IBAction func share(sender: AnyObject) {
//        healthManager.saveDistance(distanceTraveled, date: NSDate())
//    }
//
}
