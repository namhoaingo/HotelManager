//
//  DetailNavigationControllerViewController.swift
//  HotelManagement
//
//  Created by Darwin on 18/06/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import UIKit

class DetailTabControllerViewController: UITabBarController {
    var currentTransaction: Transaction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ReloadData(){
        switch self.selectedIndex {
        case 0:
            let transactionViewController: TransactionViewController = self.selectedViewController as! TransactionViewController
            transactionViewController.reloadData()
            break
        default:
            break
        }
    }
}
