//
//  Rental.swift
//  HotelManagement
//
//  Created by Darwin on 10/06/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import Foundation

class Period: NSObject{
    var CheckInDateTime:NSDate?
    var CheckOutDateTime:NSDate?
    var Duration: TimeInterval? {
        get{
            if self.CheckInDateTime != nil && self.CheckOutDateTime != nil {
              return self.CheckInDateTime!.timeIntervalSince(self.CheckOutDateTime! as Date)
            }            
            return nil
        }
    }
    
    convenience init( _ checkInDateTime: NSDate, _ checkOutDateTime: NSDate){
        self.init()
        self.CheckInDateTime = checkInDateTime
        self.CheckOutDateTime = checkOutDateTime
    }
    
    override init() {
        self.CheckOutDateTime = NSDate()
        self.CheckInDateTime = NSDate()
    }
}




