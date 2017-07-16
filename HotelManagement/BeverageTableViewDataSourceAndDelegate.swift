//
//  BeverageTableViewDataSourceAndDelegate.swift
//  HotelManagement
//
//  Created by Darwin on 09/07/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import UIKit

class BeverageTableViewDataSourceAndDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    var BeverageItems: NSMutableArray
    
    init(_ beverageItems: NSMutableArray){
        self.BeverageItems = beverageItems
    }
    
    override init() {
        self.BeverageItems = NSMutableArray()
        super.init()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "beverageIdentifier") as! BeverageItemCell
        if let beverageItem = self.BeverageItems[indexPath.row] as? BeverageItem
        {
            tableViewCell.Title.text = beverageItem.Item?.Title
            tableViewCell.Quantity.text =  String(beverageItem.Quantity)
        }
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.BeverageItems.count
    }

    // TODO: Select the beverage item to edit
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}
