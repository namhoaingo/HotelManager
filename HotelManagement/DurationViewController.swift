//
//  DurationViewController.swift
//  HotelManagement
//
//  Created by Darwin on 11/06/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import UIKit

class DurationViewController: UIViewController {

    var transactionManager: TransactionManager?
    
    @IBOutlet weak var CheckIn: UILabel!
    @IBOutlet weak var CheckOut: UILabel!
    @IBOutlet weak var CheckInPicker: UIDatePicker!
    @IBOutlet weak var CheckOutPicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
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
        if transactionManager?.CurrentTransaction != nil{
            transactionManager?.setCurrentCheckInDate(checkInDate)
        }
    }
    
    
    @IBAction func CheckOutPickerSelect(_ sender: Any) {
        let checkOutDate: NSDate = self.CheckOutPicker.date as NSDate
        if transactionManager?.CurrentTransaction != nil{
            transactionManager?.setCurrentCheckOutDate(checkOutDate)
        }
    }
    
    func reloadData()
    {
        if self.transactionManager?.CurrentTransaction != nil{
            print ("Duration View Controller Re load")
            if let checkInTime = transactionManager?.CurrentTransaction!.Period!.CheckInDateTime{
                CheckInPicker.date = checkInTime as Date
            }
            
            if let checkOutTime = transactionManager?.CurrentTransaction!.Period!.CheckOutDateTime{
                CheckOutPicker.date = checkOutTime as Date
            }
        }
    }
}
