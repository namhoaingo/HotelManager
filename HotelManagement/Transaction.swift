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
        let transaction = Transaction()
        transaction.Rate = self.Rate
        transaction.Room = self.Room
        transaction.Period = self.Period
        transaction.Customer = self.Customer
        transaction.Comment = self.Comment
        transaction.BeverageItems = self.BeverageItems
        
        return transaction
    }
    
    func isBeverageExist(_ item: Item) -> Bool{
        var existing: Bool = false
        let beverageItemsCopy = self.BeverageItems!
        let itemMatch:[Any] = beverageItemsCopy.filtered(using: NSPredicate(format: "Item.Sku MATCHES %@", item.Sku) )
        
        if itemMatch.count > 0 {
            existing = true
        }
        return existing
    }
    
    func getExistingBeverage(_ item: Item) -> BeverageItem?{
        let itemMatch: [Any] = findBeverageItem(item)
        
        if(itemMatch.count > 0)
        {
            return itemMatch.first as? BeverageItem
        }
        else{
            return nil
        }
    }
    
    func removeBeverage(_ item: Item){
        let itemMatch: [Any] = findBeverageItem(item)
        
        if (itemMatch.count > 0)
        {
            return (self.BeverageItems?.remove(itemMatch.first))!
        }
    }
    
    func findBeverageItem(_ item: Item)-> [Any]{
        let beverageItemsCopy = self.BeverageItems!
        let itemMatch:[Any] = beverageItemsCopy.filtered(using: NSPredicate(format: "Item.Sku MATCHES %@", item.Sku) )
        return itemMatch
    }
}
