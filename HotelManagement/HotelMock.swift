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

        return hotel
    }
}
