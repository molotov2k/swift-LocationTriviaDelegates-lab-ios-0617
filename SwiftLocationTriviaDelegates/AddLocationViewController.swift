//
//  AddLocationViewController.swift
//  SwiftLocationTriviaDelegates
//
//  Created by Max Tkach on 7/26/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class AddLocationViewController: UIViewController, UITextFieldDelegate {
    
    weak var delegate: AddLocationViewControllerDelegate?
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationTextField.delegate = self
        self.locationTextField.becomeFirstResponder()
        self.doneButton.enabled = false
    }
    
    
//    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
//        let existingString = textField.text! as NSString
//        let resultingName = existingString.stringByReplacingCharactersInRange(range, withString: string) as String
//        
//        delegate?.addLocationViewController(self, shouldAllowLocationNamed: resultingName)
//        
//        return true
//    }
    
    
    @IBAction func textFieldEditingChanged(sender: AnyObject) {
        print(locationTextField.text)
        if let shouldAllowLocation = self.delegate?.addLocationViewController?(self, shouldAllowLocationNamed: locationTextField.text!) {
            if shouldAllowLocation {
                self.doneButton.enabled = true
            } else {
                self.doneButton.enabled = false
            }
        } else {
            self.doneButton.enabled = true
        }
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if doneButton.enabled {
            self.delegate?.addLocationViewController(self, didAddLocationNamed: locationTextField.text!)
        }
        
        return true
    }
    
    
    @IBAction func doneButtonTapped(sender: AnyObject) {
        self.delegate?.addLocationViewController(self, didAddLocationNamed: locationTextField.text!)
    }
    
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        self.delegate?.addLocationViewControllerDidCancel(self)
    }
    
    
}



@objc protocol AddLocationViewControllerDelegate: class {
    
    func addLocationViewControllerDidCancel(viewController: AddLocationViewController)
    
    optional func addLocationViewController(viewController: AddLocationViewController,
                                            shouldAllowLocationNamed name: String) -> Bool
    
    func addLocationViewController(viewController: AddLocationViewController,
                                   didAddLocationNamed name: String)
    
}