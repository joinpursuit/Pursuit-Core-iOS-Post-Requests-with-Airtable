//
//  String+Extensions.swift
//  PostRequestsWithAirtable
//
//  Created by Cameron Rivera on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

extension String {
    static func dateFormatter() -> ISO8601DateFormatter{
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.timeZone = .current
        isoDateFormatter.formatOptions = [.withDashSeparatorInDate,
        .withFullDate
        ]
        return isoDateFormatter
    }
    
    static func getTimestamp() -> String{
        let timeStamp = String.dateFormatter().string(from: Date())
        return timeStamp
    }
    
    func convertStringToDate() -> Date {
        guard let date = String.dateFormatter().date(from: self) else {
            return Date()
        }
        return date
    }
    
    func convertDateToString() -> String{
        guard let string = String.dateFormatter().date(from: self) else {
            return self
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        let returnDate = dateFormatter.string(from: string)
        return returnDate
    }
    
}
