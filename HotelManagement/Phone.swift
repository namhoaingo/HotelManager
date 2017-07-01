//
//  PhoneModel.swift
//  HotelManagement
//
//  Created by Darwin on 10/06/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import Foundation

class Phone: NSObject{
    var AreaCode: String = ""
    var Number: String = ""
    var FormattedNumber: String{
        get{
            return AreaCode + Number
        }
    }
    
    init(_ areaCode: String, _ number: String){
        AreaCode = areaCode
        Number = number
        super.init()
    }
}
