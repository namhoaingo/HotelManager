//
//  RoomModel.swift
//  HotelManagement
//
//  Created by Darwin on 30/05/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import Foundation

class RoomModel: NSObject{
    var Id: String = ""
    var Name:String = ""
    var Floor: Int = 0
    var Rate: Double = 0.0
    var IsAvaiable: Bool = true
    var IsMaintance: Bool = false
    
    init(_ id: String, _ name:String, _ floor:Int, _ rate: Double){
        self.Id = id
        self.Name = name
        self.Floor = floor
        self.Rate = rate
        
        super.init()
    }    
    
}
