//
//  RoomsModel.swift
//  HotelManagement
//
//  Created by Darwin on 30/05/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import Foundation

class Hotel: NSObject{
    var Level:Int = 0
    var StartingLevel: Int = 2
    var RoomCollections: NSMutableArray = NSMutableArray()
    var RoomCount: Int {
        get{
            return RoomCollections.count
        }
    }
    
    func addRoom(_ room: RoomModel){
        self.RoomCollections.add(room)
    }
    
    func removeRoom(_ room: RoomModel){
        self.RoomCollections.removeObject(identicalTo: room)
    }
    
    func getLevel() -> Int{
        return self.Level
    }
    
    // Get Room for each level
    func getRoomsInLevel(_ level: Int)-> NSMutableArray{
        let levelPredicate = NSPredicate(format: "(Floor == \(level + StartingLevel))")
        let copyOfRoomCollection: NSMutableArray = NSMutableArray(array: RoomCollections)
        
        copyOfRoomCollection.filter(using: levelPredicate)
        return copyOfRoomCollection
    }
    
    func getRoom(_ index: Int) -> RoomModel{
        return RoomCollections[index] as! RoomModel
    }
}
