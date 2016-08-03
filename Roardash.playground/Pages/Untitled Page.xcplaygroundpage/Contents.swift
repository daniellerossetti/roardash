import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet var label:UILabel!
    
    // class wide constant !!
    let pedometer = CMPedometer()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if CMPedometer.isStepCountingAvailable()
        {
            pedometer.startPedometerUpdatesFromDate(NSDate())
            {
                (data: CMPedometerData?, error) -> Void in
                dispatch_async(dispatch_get_main_queue(),
                {
                    () -> Void in
                    if error == nil
                    {
                        let steps = data!.numberOfSteps
                        self.label.text = "steps: \(steps)"
                    }
                    else{
                        print("Hi!")
                    }
                    
                }
                
            })
        }

    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Confirmation of CMPedometer
//        if CMPedometer.isStepCountingAvailable() {
//            pedometer.startPedometerUpdatesFromDate(NSDate()){
//                (data: CMPedometerData?, error) -> Void in
//                dispatch_async(dispatch_get_main_queue(), {
//                    () -> Void in
//                    if error == nil {
//                        // Number of steps
//                        let steps = data!.numberOfSteps
//                        self.label.text = "steps: \(steps)"
//                    }
//    
//                })
//            }
//        else {
//               let error_message = "hi"
//                print(error_message)
//        }
//        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

