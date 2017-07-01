//
//  MasterViewController.swift
//  HotelManagement
//
//  Created by Darwin on 30/05/2017.
//  Copyright © 2017 Nam  Ngo. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController{
    var detailNavigationController: DetailTabControllerViewController?
    
    @IBOutlet weak var SegmentOutlet: UISegmentedControl!
    @IBOutlet weak var RoomNumber: UILabel!
    @IBAction func SegmentSelect(_ sender: UISegmentedControl) {
            detailNavigationController?.selectedIndex = self.SegmentOutlet.selectedSegmentIndex
    }
    
    @IBOutlet weak var navigationView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationView.isHidden = true
        EventManager.listenTo(eventName: EventsConstant.transaction_change.rawValue, action: renderView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // setup the refresh view delegate
    func renderView() {
        if let currentRoom = TransactionManager.CurrentTransaction?.Room {
            // set all the seperate view with new object
            self.RoomNumber.text = currentRoom.Name
            self.navigationView.isHidden = false
            detailNavigationController?.ReloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier != nil && segue.identifier! == "detailSegue")
        {
            let master: MasterViewController = sender as! MasterViewController
            detailNavigationController = segue.destination as! DetailTabControllerViewController
            detailNavigationController?.selectedIndex = master.SegmentOutlet.selectedSegmentIndex
        }
    }
    
}
