//
//  HotelMock.swift
//  HotelManagement
//
//  Created by Darwin on 11/06/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import Foundation

class HotelMock: NSObject {
    
    func initialHotel() -> HotelRawData{
        let hotel: HotelRawData = HotelRawData()
        hotel.addRoom(RoomModel("201", "201", 2, 200.0))
        hotel.addRoom(RoomModel("301", "301", 3, 200.0))
        hotel.addRoom(RoomModel("302", "302", 3, 200.0))
        hotel.addRoom(RoomModel("401", "401", 4, 200.0))
        hotel.addRoom(RoomModel("402", "402", 4, 200.0))
        hotel.addRoom(RoomModel("403", "403", 4, 200.0))
        hotel.addRoom(RoomModel("404", "404", 4, 200.0))
        hotel.addRoom(RoomModel("405", "405", 4, 200.0))
        hotel.addRoom(RoomModel("406", "406", 4, 200.0))
        
        // Beverage
        hotel.addBeverage(Item("117", "Food1", Price(10.0, "VND")))
        hotel.addBeverage(Item("118", "Food2", Price(11.0, "VND")))
        hotel.addBeverage(Item("119", "Food3", Price(12.0, "VND")))
        hotel.addBeverage(Item("120", "Food4", Price(13.0, "VND")))
        hotel.addBeverage(Item("130", "Food5", Price(14.0, "VND")))
        return hotel
    }
}
