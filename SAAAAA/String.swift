//
//  String.swift
//  SAAAAA
//
//  Created by Peter Alserda on 08/03/16.
//  Copyright © 2016 Peter Alserda. All rights reserved.
//

import Foundation

extension String {
    func formatDate(dateString: String) -> NSDate {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return dateFormatter.dateFromString(dateString)!
    }
}