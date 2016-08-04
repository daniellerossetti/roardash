//
//  TimerViewController.swift
//  OneHourWalker
//
//  Created by Matthew Maher on 2/18/16.
//  Copyright © 2016 Matt Maher. All rights reserved.
//

import UIKit
import CoreLocation
//import HealthKit

class TimerViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var milesLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    var zeroTime = NSTimeInterval()
    var timer : NSTimer = NSTimer()
    
    let locationManager = CLLocationManager()
    var startLocation: CLLocation!
    var lastLocation: CLLocation!
    var distanceTraveled = 0.0
    var timerStartDate: NSDate!
    
//    let healthManager:HealthKitManager = HealthKitManager()
//    var height: HKQuantitySample?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        } else {
            print("Need to Enable Location")
        }
        
        // We cannot access the user's HealthKit data without specific permission.
//        getHealthKitPermission()
    }

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
    
    @IBAction func startTimer(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
        zeroTime = NSDate.timeIntervalSinceReferenceDate()
        
        distanceTraveled = 0.0
        startLocation = nil
        lastLocation = nil
        timerStartDate = NSDate()
        
        locationManager.startUpdatingLocation()
    }
    
    @IBAction func stopTimer(sender: AnyObject) {
        timer.invalidate()
        locationManager.stopUpdatingLocation()
    }
    
    func updateTime() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        var timePassed: NSTimeInterval = currentTime - zeroTime
        let minutes = UInt8(timePassed / 60.0)
        timePassed -= (NSTimeInterval(minutes) * 60)
        let seconds = UInt8(timePassed)
        timePassed -= NSTimeInterval(seconds)
        let millisecsX10 = UInt8(timePassed * 100)
        
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strMSX10 = String(format: "%02d", millisecsX10)
        
        timerLabel.text = "\(strMinutes):\(strSeconds):\(strMSX10)"
        
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
            //            Why set locations.first as CLLocation when in the beginning the variable type was specified?
            startLocation = currentLocation
        } else {
            let lastDistance = lastLocation.distanceFromLocation(currentLocation)
            distanceTraveled += lastDistance * 0.000621371
            
            //        Why format: "%.2f" and trimmedDistance?
            let trimmedDistance = String(format: "%.2f", distanceTraveled)
            
            milesLabel.text = "\(trimmedDistance) Miles"
        }
        
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
