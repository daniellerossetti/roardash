

let oneWeekInterval = 24 * 3600 as NSTimeInterval
motionActivityManager.queryActivityStartingFromDate(NSDate(timeIntervalSinceNow: -oneWeekInterval),
                                                    toDate: NSDate(), toQueue: motionHandlerQueue) {
                                                        (activities, error) in
                                                        if error != nil {
                                                            println("There was an error retrieving the motion results: \(error)")
                                                        }
                                                        self.activityCollection = ActivityCollection(activities: activities as! [CMMotionActivity])
}