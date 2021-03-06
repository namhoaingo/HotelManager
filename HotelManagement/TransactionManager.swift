//
//  RentalManager.swift
//  HotelManagement
//
//  Created by Darwin on 10/06/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import Foundation

struct TransactionManager {
    // Dictionary contains Room key and Transaction object
    static var RentalDictionary: NSMutableDictionary =  NSMutableDictionary();
    
    static var CurrentTransaction: Transaction?
    static var BeverageList: NSMutableArray?
    
    static func setTransaction(_ room: RoomModel, _ beverage: NSMutableArray){
        
        if RentalDictionary[room.Id] != nil{
            // update
            CurrentTransaction = getExistingRental(room)
        }
        else{
            let newTransaction = getNewRental(room)
            CurrentTransaction = newTransaction
            // Add to Transaction
            RentalDictionary[newTransaction.Room!.Id] = newTransaction
        }
        self.BeverageList = beverage        
        // Raise Event
        EventManager.trigger(eventName: EventsConstant.transaction_change.rawValue, information: "")
    }
    
    static func getNewRental(_ room: RoomModel)-> Transaction{
        let transaction: Transaction = Transaction()
        
        // Create temporary rate object
        // We will decide later if this one is hour rate or daily rate
        transaction.Rate = Rate()
        transaction.Period = Period()
        transaction.Customer = Customer()
        transaction.Comment = Comment()
        transaction.BeverageItems = NSMutableArray()
        transaction.Room = room
        
        return transaction
    }
    
    static func getExistingRental(_ room: RoomModel) -> Transaction{
        return RentalDictionary[room.Id] as! Transaction
    }
    
    static func addRental(_ transaction: Transaction){
        // Check for adding new or edditing
        if let currentRoom = transaction.Room {
            RentalDictionary.setObject(currentRoom.Id, forKey: transaction)
        }
    }
    
    static func getCurrentCheckInDate() -> NSDate{
        return (self.CurrentTransaction?.Period?.CheckInDateTime)!
    }
    
    static func getCurrentCheckOutDate() -> NSDate{
        return (self.CurrentTransaction?.Period?.CheckOutDateTime)!
    }
    
    static func setCurrentCheckInDate(_ checkInDate: NSDate){
        self.CurrentTransaction?.Period?.CheckInDateTime = checkInDate
    }
    
    static func setCurrentCheckOutDate(_ checkOutDate: NSDate)
    {
        self.CurrentTransaction?.Period?.CheckOutDateTime = checkOutDate
    }
    
    
    // Beverage Item
    static func getBeverageItems()-> NSMutableArray{
        return (self.CurrentTransaction?.BeverageItems)!
    }
    
    static func addBeverageItem(_ item: Item, _ quantity: Int){
        // find BeverageItem in the aray
        
        if (CurrentTransaction?.isBeverageExist(item))!{
            if let existingBeverage: BeverageItem = (CurrentTransaction?.getExistingBeverage(item)){
                existingBeverage.Quantity = existingBeverage.Quantity + quantity
                if(existingBeverage.Quantity == 0){
                    // remove the item 
                    CurrentTransaction?.removeBeverage(item)
                }
            }
        }
        else{
            let addingBeverageItem = BeverageItem(item, quantity)
            self.CurrentTransaction?.BeverageItems?.add(addingBeverageItem)
        }
    }
    
    //Beverage Available
    static func getBeverageAtIndex(_ index: Int)-> Item{
        return self.BeverageList?[index] as! Item
    }
    
    
}
