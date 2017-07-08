//
//  BeverageItem.swift
//  HotelManagement
//
//  Created by Darwin on 08/07/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import UIKit

class BeverageItem: NSObject {
    var item: Item?
    var Quantity: Int = 0
    
    init(_ item: Item, _ quantity: Int){
        self.item = item
        self.Quantity = quantity
    }
    
}
