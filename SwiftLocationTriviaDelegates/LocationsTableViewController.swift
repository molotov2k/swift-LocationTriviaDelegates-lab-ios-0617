//
//  LocationsTableViewController.swift
//  SwiftLocationTriviaDelegates
//
//  Created by Max Tkach on 7/26/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class LocationsTableViewController: UITableViewController {
    
    var locations = [Location]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.locations.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("locationsCell", forIndexPath: indexPath)
        cell.textLabel?.text = self.locations[indexPath.row].name
        
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let viewController = segue.destinationViewController as! AddLocationViewController
        viewController.delegate = self
    }

    
}



extension LocationsTableViewController: AddLocationViewControllerDelegate {
    
    
    func addLocationViewControllerDidCancel(viewController: AddLocationViewController) {
        //viewController.dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
//    func addLocationViewController(viewController: AddLocationViewController, shouldAllowLocationNamed name: String) -> Bool {
//        for location in self.locations {
//            if location.name == name {
//                //viewController.doneButton.enabled = false
//                //return
//                return false
//            }
//        }
//        
//        //viewController.doneButton.enabled = true
//        return true
//    }
    
    
    func addLocationViewController(viewController: AddLocationViewController, didAddLocationNamed name: String) {
        let location = Location(name: name, trivia: [])
        self.locations.append(location)
        //viewController.dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popViewControllerAnimated(true)
        self.tableView.reloadData()
    }
    
    
}