//
//  TransactionViewController.swift
//  HotelManagement
//
//  Created by Darwin on 11/06/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import UIKit

class TransactionViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var QuantityControl: UIStepper!
    @IBOutlet weak var ItemCount: UILabel!
    @IBOutlet weak var BeveragePick: UIPickerView!
    @IBOutlet weak var CheckIn: UILabel!
    @IBOutlet weak var CheckOut: UILabel!
    @IBOutlet weak var CheckInPicker: UIDatePicker!
    @IBOutlet weak var CheckOutPicker: UIDatePicker!
    @IBOutlet weak var BeverageTable: UITableView!
    var beverageTableDataSourceAngDelegate: BeverageTableViewDataSourceAndDelegate = BeverageTableViewDataSourceAndDelegate()
    var oldValue = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Init datasource for Beverage Table
        
        self.BeverageTable.dataSource = self.beverageTableDataSourceAngDelegate
        self.BeverageTable.delegate = self.beverageTableDataSourceAngDelegate
        self.ItemCount.text = "1"
        oldValue = Int(QuantityControl.value);
    }
    
    override func viewWillAppear(_ animated: Bool) {        
        self.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func CheckInPickerSelect(_ sender: Any) {
        let checkInDate: NSDate = self.CheckInPicker.date as NSDate
        if TransactionManager.CurrentTransaction != nil{
            TransactionManager.setCurrentCheckInDate(checkInDate)
        }
    }
    
    
    @IBAction func CheckOutPickerSelect(_ sender: Any) {
        let checkOutDate: NSDate = self.CheckOutPicker.date as NSDate
        if TransactionManager.CurrentTransaction != nil{
            TransactionManager.setCurrentCheckOutDate(checkOutDate)
        }
    }
    
    func reloadData()
    {
        if TransactionManager.CurrentTransaction != nil{            
            if let checkInTime = TransactionManager.CurrentTransaction!.Period!.CheckInDateTime{
                CheckInPicker.date = checkInTime as Date
            }
            
            if let checkOutTime = TransactionManager.CurrentTransaction!.Period!.CheckOutDateTime{
                CheckOutPicker.date = checkOutTime as Date
            }
            // Reload Beverage selection Dropdown list
            self.BeveragePick.dataSource = self
            self.BeveragePick.delegate = self
            self.BeveragePick.reloadAllComponents()
            
            // Reload Beverage Table
            self.beverageTableDataSourceAngDelegate.BeverageItems = TransactionManager.getBeverageItems()
            self.BeverageTable.reloadData()
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (TransactionManager.BeverageList?.count)!
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let berItem: Item = TransactionManager.getBeverageAtIndex(row)
        return berItem.Title + String(describing: berItem.Price?.Amount)
    }
    
    
    // Picker Action
    @IBAction func QuantityChange(_ sender: Any) {
        var edittingValue = 1;
        if (Int(QuantityControl.value)>oldValue) {
            oldValue = oldValue + 1
            edittingValue = 1
        }
        else{
            oldValue = oldValue - 1
            edittingValue = -1
        }

        
        let beverageEditing = self.BeveragePick.selectedRow(inComponent: 0)
        TransactionManager.addBeverageItem(TransactionManager.BeverageList?[beverageEditing] as! Item, edittingValue)
        self.BeverageTable.reloadData()
    }
}
