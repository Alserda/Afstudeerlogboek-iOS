//
//  NSDate.swift
//  SAAAAA
//
//  Created by Peter Alserda on 06/03/16.
//  Copyright © 2016 Peter Alserda. All rights reserved.
//

import Foundation

extension NSDate {
    func currentDateInDayMonthYear() -> (String) {
        let components = NSCalendar.currentCalendar().components([.Day, .Month, .Year], fromDate: self)
        let monthName = NSDateFormatter().monthSymbols[components.month - 1]
        return "\(String(components.day)) \(monthName) \(String(components.year))"
    }
    
    func formatDateToDayMonthYear(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "d LLLL yyyy"
        
        return dateFormatter.stringFromDate(date)
        
    }
}
