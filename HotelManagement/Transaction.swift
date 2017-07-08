//
//  Transaction.swift
//  HotelManagement
//
//  Created by Darwin on 10/06/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import Foundation

class Transaction: NSObject, NSCopying{
    var Rate: Rate?
    var Room: RoomModel?
    var Period: Period?
    var Customer: Customer?
    var Comment: Comment?
    var BeverageItems: NSMutableArray?
    
    // Constructor
    
    // NSCopying
    func copy(with zone: NSZone? = nil) -> Any {
        var transaction = Transaction()
        transaction.Rate = self.Rate
        transaction.Room = self.Room
        transaction.Period = self.Period
        transaction.Customer = self.Customer
        transaction.Comment = self.Comment
        transaction.BeverageItems = self.BeverageItems
        
        return transaction
    }
}
