//
//  UIView.swift
//  SAAAAA
//
//  Created by Peter Alserda on 06/03/16.
//  Copyright © 2016 Peter Alserda. All rights reserved.
//

import UIKit

extension UIView {
    func centerWithTopMargin(viewController: UIViewController, placeUnderViews: [UIView]?, topMargin: CGFloat) {
        var addedViewHeight : CGFloat = 0
        
        if let extraViews = placeUnderViews {
            for view in extraViews {
                addedViewHeight += view.bounds.size.height
            }
        }
        
        let horizontalConstraint = self.topAnchor.constraintEqualToAnchor(viewController.topLayoutGuide.bottomAnchor, constant: addedViewHeight + topMargin)
        let verticalConstraint = self.centerXAnchor.constraintEqualToAnchor(viewController.view.centerXAnchor)
        NSLayoutConstraint.activateConstraints([horizontalConstraint, verticalConstraint])
    }
    
    func centerWithTopMarginInView(view: UIView, placeUnderViews: [UIView]?, topMargin: CGFloat) {
        var addedViewHeight : CGFloat = 0
        
        if let extraViews = placeUnderViews {
            for view in extraViews {
                for constraint in view.constraints {
                    if constraint.identifier == "height" {
                        addedViewHeight += constraint.constant
                    }
                }
            }
        }
        
        let horizontalConstraint = self.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: addedViewHeight + topMargin)
        let verticalConstraint = self.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor)
        NSLayoutConstraint.activateConstraints([horizontalConstraint, verticalConstraint])
    }
    
    func constrainToSize (size : CGSize) {
        let widthConstraint = self.widthAnchor.constraintEqualToAnchor(nil, constant: size.width)
        widthConstraint.identifier = "width"
        let heightConstraint = self.heightAnchor.constraintEqualToAnchor(nil, constant: size.height)
        heightConstraint.identifier = "height"
        NSLayoutConstraint.activateConstraints([widthConstraint, heightConstraint])
    }
}
