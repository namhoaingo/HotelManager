//
//  DetailCollectionViewController.swift
//  HotelManagement
//
//  Created by Darwin on 01/06/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import UIKit


private let reuseIdentifier = "Cell"
class DetailCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    var hotelInitial : RoomManager  = RoomManager()
    var myDelegate : Hotel = Hotel()
    var seletedIndex: IndexPath?
    
    override func viewDidLoad() {
        self.myDelegate = hotelInitial.initHotel()
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.myDelegate.Levels.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.myDelegate.getRoomCount(atLevel: self.myDelegate.Levels.count - section + 1)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RoomCollectionViewCell
        cell.RoomDisplayLabel.lineBreakMode =  NSLineBreakMode.byCharWrapping
        
        // Configure the cell
        cell.RoomDisplayLabel.text = self.myDelegate.getRoom(atLevel: self.myDelegate.Levels.count - indexPath.section + 1, atIndex: indexPath.row).Name
        
        cell.changeNonSelectedColor()
        if self.seletedIndex != nil {
            if(indexPath == self.seletedIndex!){
                cell.changeSelectedColor()
            }
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print ("row \(indexPath.row) + section \(indexPath.section)" );
        // Set current Room in Transaction Manager
        TransactionManager.setTransaction(self.myDelegate.getRoom(atLevel: self.myDelegate.Levels.count - indexPath.section + 1 , atIndex: indexPath.row))
        
        // Update Color
        self.seletedIndex = indexPath
        collectionView.reloadData()
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
    }
    
    /*Lay out Collection View Cell */

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(50)
    }
    
}
