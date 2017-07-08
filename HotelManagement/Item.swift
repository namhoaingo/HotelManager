//
//  Item.swift
//  HotelManagement
//
//  Created by Darwin on 08/07/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import UIKit

class Item: NSObject {
    var sku: String = ""
    var title: String = ""
    var price: Price?
    
    init(_ sku: String, _ title: String, _ price: Price) {
        self.sku = sku
        self.title = title
        self.price = price
    }
}
