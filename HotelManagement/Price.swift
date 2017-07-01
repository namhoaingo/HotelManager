//
//  Price.swift
//  HotelManagement
//
//  Created by Darwin on 10/06/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import Foundation

class Price: NSObject{
    var Amount: Decimal = 0.00
    var Currency: String = "VND"
    
    init(_ amount: Decimal, _ currency: String){
        Amount = amount
        Currency = currency
        super.init()
    }
}
