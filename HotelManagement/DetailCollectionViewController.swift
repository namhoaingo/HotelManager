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
    var HotelInitial : HotelMock = HotelMock()
    var myDelegate : Hotel = Hotel()
    
    override func viewDidLoad() {
        self.myDelegate = HotelInitial.initialHotel()
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.myDelegate.getLevel()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        let roomInLevel: NSMutableArray = self.myDelegate.getRoomsInLevel(section)
        return roomInLevel.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RoomCollectionViewCell
        cell.RoomDisplayLabel.lineBreakMode =  NSLineBreakMode.byCharWrapping
        
        // Configure the cell
        //cell.RoomDisplayLabel.text = "row \(indexPath.row) \r\n + section \(indexPath.section)"
        cell.RoomDisplayLabel.text = self.myDelegate.getRoom(indexPath.row).Name
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print ("row \(indexPath.row) + section \(indexPath.section)" );
        let masterViewController:MasterViewController = self.splitViewController?.viewControllers.first as! MasterViewController
        // Set current Room in Transaction Manager
        TransactionManager.setTransaction(self.myDelegate.getRoom(indexPath.row))
        
    }
}
