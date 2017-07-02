//
//  Level.swift
//  HotelManagement
//
//  Created by Darwin on 01/07/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import UIKit

class Level: NSObject {
    var Rooms: NSMutableArray = NSMutableArray()
    var Number: Int = 0
    
    func getRoom(byIndex index:Int)-> RoomModel{
        return Rooms[index] as! RoomModel
    }
    
    func addRoom(_ room:RoomModel){
        Rooms.add(room)
    }
    
    func RoomCount()-> Int{
        return Rooms.count
    }
}
