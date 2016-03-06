//
//  DeviceSize.swift
//  SAAAAA
//
//  Created by Peter Alserda on 06/03/16.
//  Copyright © 2016 Peter Alserda. All rights reserved.
//

import UIKit

struct deviceSize {
    static let IS_IPAD = UIDevice.currentDevice().userInterfaceIdiom == .Pad
    static let IS_IPHONE = UIDevice.currentDevice().userInterfaceIdiom == .Phone
    static let IS_RETINA = UIScreen.mainScreen().scale >= 2.0
    
    static let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    static let SCREEN_MAX_LENGTH = max(SCREEN_WIDTH, SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(SCREEN_WIDTH, SCREEN_HEIGHT)
    
    static let IS_IPHONE_4_OR_LESS = (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
    static let IS_IPHONE_5 = (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
    static let IS_IPHONE_6 = (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
    static let IS_IPHONE_6P = (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
}