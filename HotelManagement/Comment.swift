//
//  Comment.swift
//  HotelManagement
//
//  Created by Darwin on 10/06/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import Foundation

class Comment: NSObject{
    var RecordTime: NSDate = NSDate()
    var Content: String = ""
    
    convenience init(_ recordTime: NSDate, _ content: String) {
        self.init()
        RecordTime = recordTime
        Content = content
    }
}
