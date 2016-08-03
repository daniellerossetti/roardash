//
//  CountdownLabel.h
//  Timer Take 2
//
//  Created by Girls Who Code on 8/3/16.
//  Copyright © 2016 Girls Who Code. All rights reserved.
//

#ifndef CountdownLabel_h
#define CountdownLabel_h

func update() {
    let timeLeftInteger = Int(timeLeft())
    text = String(timeLeftInteger)
}
func startWithDuration(duration: NSTimeInterval) {
    let timeNow = NSDate();
    endTime = timeNow.dateByAddingTimeInterval(duration)
}
func hasFinished() -> Bool {
    return timeLeft() == 0;
}

#endif /* CountdownLabel_h */
