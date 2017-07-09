//
//  Item.swift
//  HotelManagement
//
//  Created by Darwin on 08/07/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import UIKit

class Item: NSObject {
    var Sku: String = ""
    var Title: String = ""
    var Price: Price?
    
    init(_ sku: String, _ title: String, _ price: Price) {
        self.Sku = sku
        self.Title = title
        self.Price = price
    }
}
