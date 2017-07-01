//
//  CustomerModel.swift
//  HotelManagement
//
//  Created by Darwin on 10/06/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import Foundation


class Customer:NSObject{
    var Name: String = ""
    var Id: String = ""
    var Phone: Phone?
    
    convenience init(_ name:String, _ id:String, _ phone: Phone){
        self.init()
        self.Name = name
        self.Id = id
        self.Phone = phone
        
    }
}
