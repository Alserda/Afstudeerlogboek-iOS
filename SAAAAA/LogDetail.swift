//
//  LogDetail.swift
//  SAAAAA
//
//  Created by Peter Alserda on 07/03/16.
//  Copyright © 2016 Peter Alserda. All rights reserved.
//

import UIKit

class LogDetail: UIViewController {
    @IBOutlet var scrollView: UIScrollView!

    override func viewDidLoad() {
        print(__FUNCTION__)
        styleView()
    }
    
    
    func styleView() {
        scrollView.contentSize = CGSizeMake(320, 5000)
    }
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
}

