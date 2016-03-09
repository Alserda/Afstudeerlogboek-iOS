//
//  UIImageView.swift
//  SAAAAA
//
//  Created by Peter Alserda on 09/03/16.
//  Copyright © 2016 Peter Alserda. All rights reserved.
//

import UIKit

extension UIImageView {
    func vibrate(viewController: UIViewController, xConstraint: NSLayoutConstraint) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.04
        animation.repeatCount = 50
        animation.autoreverses = true
        
        let position = viewController.view.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor, constant: xConstraint.constant)
        
        print(position)
        animation.fromValue = position.constant - 2.0
        animation.toValue = position.constant + 2.0
        
        self.layer.addAnimation(animation, forKey: "position")
//        animation.fromValue = viewController.view.centerXAnchor - xConstraint
//        animation.fromValue = NSValue(CGPoint: CGPointMake(bounds.origin.x - 2.0, bounds.origin.y))
//        animation.toValue = NSValue(CGPoint: CGPointMake(bounds.origin.x + 2.0, bounds.origin.y))
//        self.layer.addAnimation(animation, forKey: "position")
    }
}
