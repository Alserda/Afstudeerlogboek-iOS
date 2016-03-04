//
//  AddPostViewController.swift
//  SAAAAA
//
//  Created by Peter Alserda on 04/03/16.
//  Copyright © 2016 Peter Alserda. All rights reserved.
//

import UIKit

class AddPostViewController: UIViewController {
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var bodyField: UITextField!
    @IBOutlet var logboekContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(__FUNCTION__)
        navigationItem.hidesBackButton = true
        //        tableView.backgroundColor = UIColor.redColor()
        // Do any additional setup after loading the view, typically from a nib.
        styleApplication()
    }
    
    func styleApplication() {
        saveButton.layer.cornerRadius = 3
        saveButton.imageEdgeInsets = UIEdgeInsets(top: 3, left: -10, bottom: 0, right: 0)
       print(logboekContainer.frame)

    }
    

    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}