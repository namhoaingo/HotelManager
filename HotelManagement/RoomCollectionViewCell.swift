//
//  RoomCollectionViewCell.swift
//  HotelManagement
//
//  Created by Darwin on 01/06/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import UIKit

class RoomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var RoomDisplayLabel: UILabel!
    
    func changeSelectedColor(){
        self.backgroundColor = UIColor.green
    }
    
    func changeNonSelectedColor(){
        self.backgroundColor = UIColor.red
    }
}
