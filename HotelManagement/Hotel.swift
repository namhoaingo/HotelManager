//
//  Hotel.swift
//  HotelManagement
//
//  Created by Darwin on 01/07/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import UIKit

class Hotel: NSObject {
    var Levels: NSMutableArray = NSMutableArray()
    
    func addLevel(_ level: Level){
        Levels.add(level)
    }
    
    func getRoomCount(atLevel level:Int) -> Int{
        let level = Levels[level] as! Level
        return level.RoomCount()
    }
    
    func getRoom(atLevel level:Int, atIndex index: Int)-> RoomModel{
        let level = Levels[level] as! Level
        return level.getRoom(byIndex: index)
    }
}
