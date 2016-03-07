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
    @IBOutlet var topContainer: UIView!
    
    override func viewDidLoad() {
        print(__FUNCTION__)
        styleView()
    }
    
    
    func styleView() {
        scrollView.contentSize = CGSizeMake(320, 5000)
        
        topContainer.translatesAutoresizingMaskIntoConstraints = false
        topContainer.removeConstraints(topContainer.constraints)
        topContainer.topAnchor.constraintEqualToAnchor(scrollView.topAnchor, constant: -20).active = true
        
        print(scrollView.frame.size)
        
        topContainer.constrainToSize(CGSize(width: scrollView.frame.width, height: 69))
        
        
    }
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
}

