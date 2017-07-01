//
//  RentalManager.swift
//  HotelManagement
//
//  Created by Darwin on 10/06/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import Foundation

class TransactionManager: NSObject {
    // Dictionary contains Room key and Transaction object
    var RentalDictionary: NSMutableDictionary =  NSMutableDictionary();

    var CurrentTransaction: Transaction?
    
    // This the function to pass in when CurrentRoom got a new value
    var RenderNewTransaction: (()-> Void)?
    
    func setTransaction(_ room: RoomModel){
        
        if RentalDictionary[room.Id] != nil{
            // update
            CurrentTransaction = getExistingRental(room)
        }
        else{
            CurrentTransaction = getNewRental(room)
        }
        
        if(RenderNewTransaction != nil)
        {
            RenderNewTransaction!()
        }
    }
    
    
    func getNewRental(_ room: RoomModel)-> Transaction{
        let transaction: Transaction = Transaction()
        
        // Create temporary rate object
        // We will decide later if this one is hour rate or daily rate
        transaction.Rate = Rate()
        transaction.Period = Period()
        transaction.Customer = Customer()
        transaction.Comment = Comment()
        transaction.Room = room
        
        return transaction
    }
    
    func getExistingRental(_ room: RoomModel) -> Transaction{
        return RentalDictionary[room.Id] as! Transaction
    }
    
    func addRental(_ transaction: Transaction){
        // Check for adding new or edditing
        if let currentRoom = transaction.Room {
            RentalDictionary.setObject(currentRoom.Id, forKey: transaction)
            
        }
    }
    
    func getCurrentCheckInDate() -> NSDate{
        return (self.CurrentTransaction?.Period?.CheckInDateTime)!
    }
    
    func getCurrentCheckOutDate() -> NSDate{
        return (self.CurrentTransaction?.Period?.CheckOutDateTime)!
    }
    
    func setCurrentCheckInDate(_ checkInDate: NSDate){
        self.CurrentTransaction?.Period?.CheckInDateTime = checkInDate
    }
    
    func setCurrentCheckOutDate(_ checkOutDate: NSDate)
    {
        self.CurrentTransaction?.Period?.CheckOutDateTime = checkOutDate
    }
}
