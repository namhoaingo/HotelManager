//
//  RoomsModel.swift
//  HotelManagement
//
//  Created by Darwin on 30/05/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import Foundation

class HotelRawData: NSObject{
    var RoomCollections: NSMutableArray = NSMutableArray()
    var BeverageList: NSMutableArray = NSMutableArray()
    func addRoom(_ room: RoomModel){
        self.RoomCollections.add(room)
    }
    
    func removeRoom(_ room: RoomModel){
        self.RoomCollections.removeObject(identicalTo: room)
    }
    
    func addBeverage(_ item: Item){
        self.BeverageList.add(item)
    }
    
    func removeBeverage(_ item: Item){
        self.BeverageList.remove(item)
    }
}
