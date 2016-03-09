//
//  Settings.swift
//  SAAAAA
//
//  Created by Peter Alserda on 09/03/16.
//  Copyright © 2016 Peter Alserda. All rights reserved.
//

import UIKit

class Settings: UIViewController, UITextFieldDelegate {
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        print(__FUNCTION__)
        saveButton.layer.cornerRadius = 3
        saveButton.imageEdgeInsets = UIEdgeInsets(top: 3, left: -10, bottom: 0, right: 0)
        textField.delegate = self
        
        if let authorName = UserDefaults.retrieveAuthorName() {
            textField.text = authorName
        }
    }

    @IBAction func saveButtonPressed(sender: AnyObject) {
        storeAuthor()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        storeAuthor()
        return true
    }
    
    func storeAuthor() {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(textField.text!, forKey: "authorName")
        tabBarController?.selectedIndex = 0
    }
}
