//
//  RoomManager.swift
//  HotelManagement
//
//  Created by Darwin on 02/07/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import UIKit

struct RoomManager {
    func initHotel()-> Hotel{
        let hotelRawData: HotelRawData = HotelMock().initialHotel()
        let hotel: Hotel = Hotel()
        for room in hotelRawData.RoomCollections{
            let roomModel = room as! RoomModel
            hotel.addRoom(roomModel)
        }        
        
        for item in hotelRawData.BeverageList{
            let itemModel = item as! Item
            hotel.addBeverage(itemModel)
        }
        
        return hotel
    }
}
