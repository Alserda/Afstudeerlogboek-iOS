//
//  NSDate.swift
//  SAAAAA
//
//  Created by Peter Alserda on 06/03/16.
//  Copyright © 2016 Peter Alserda. All rights reserved.
//

import Foundation

extension NSDate {
    func currentDateInDayMonthYear() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "d LLLL yyyy"
        return dateFormatter.stringFromDate(self)
    }
    
    func formatDateToDayMonthYear(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "d LLLL yyyy"
        
        return dateFormatter.stringFromDate(date)
        
    }
}