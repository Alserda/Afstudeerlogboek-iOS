//
//  LogDetail.swift
//  SAAAAA
//
//  Created by Peter Alserda on 07/03/16.
//  Copyright © 2016 Peter Alserda. All rights reserved.
//

import UIKit

class LogDetail: UIViewController {
    
    @IBOutlet var bodyField: UITextView!
    @IBOutlet var bottomContainer: UIView!

    override func viewDidLoad() {
        print(__FUNCTION__)
        styleView()
    }
    
    
    func styleView() {
        bodyField.contentInset = UIEdgeInsetsMake(-13, -6, 0, 0)
        bodyField.scrollEnabled = false
        bodyField.sizeToFit()
        bottomContainer.sizeToFit()
        
        let fixedWidth = bodyField.frame.size.width
        bodyField.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        let newSize = bodyField.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        var newFrame = bodyField.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        print(bodyField.frame)
        print(newFrame.height)
        bodyField.frame = newFrame;
    }
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
}

