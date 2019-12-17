//
//  String+Extensions.swift
//  PostRequestsWithAirtable
//
//  Created by Cameron Rivera on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

extension String {
    
    static func projectDateFormatter() -> ISO8601DateFormatter{
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.timeZone = .current
        isoDateFormatter.formatOptions = [.withFullDate,
                                          .withDashSeparatorInDate
        ]
        return isoDateFormatter
    }
    
    static func clientDateFormatter() -> ISO8601DateFormatter{
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.timeZone = .current
        isoDateFormatter.formatOptions = [.withInternetDateTime,
                                          .withFractionalSeconds]
        return isoDateFormatter
    }
    
    static func getTimestamp() -> String{
        let timeStamp = String.clientDateFormatter().string(from: Date())
        return timeStamp
    }
    
    func convertStringToDate() -> Date {
        guard let date = String.clientDateFormatter().date(from: self) else {
            return Date()
        }
        return date
    }
    
    func convertClientDateToString() -> String{
        guard let string = String.clientDateFormatter().date(from: self) else {
            return self
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        let returnDate = dateFormatter.string(from: string)
        return returnDate
    }
    
    func convertProjectDateToString() -> String{
        guard let string = String.projectDateFormatter().date(from: self) else {
            return self
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        let returnDate = dateFormatter.string(from: string)
        return returnDate
    }
    
}
