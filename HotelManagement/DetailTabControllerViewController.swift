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
    
    
    // segue to something other controller
    func segueTo(_ segueIden: String){
        performSegue(withIdentifier: segueIden, sender: self)
    }
    
    func ReloadData(){
        switch self.selectedIndex {
        case 0:
            let durationViewController: DurationViewController = self.selectedViewController as! DurationViewController
            durationViewController.reloadData()
            break
        default:
            break
        }
    }
}
