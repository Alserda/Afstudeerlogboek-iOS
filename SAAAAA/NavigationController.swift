//
//  NavigationController.swift
//  SAAAAA
//
//  Created by Peter Alserda on 04/03/16.
//  Copyright © 2016 Peter Alserda. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        self.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "PTSans-Bold", size: 17)!, NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
}
