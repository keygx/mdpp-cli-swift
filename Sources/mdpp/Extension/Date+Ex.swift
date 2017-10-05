//
//  Date+Ex.swift
//  mdpp
//
//  Created by keygx on 2017/09/28.
//

import Foundation

extension String {
    // MARK: String -> Date
    func toDate(dateFormat: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: Config.localeId)
        dateFormatter.calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        dateFormatter.dateFormat = dateFormat
                
        return dateFormatter.date(from: self)
    }
}

extension Date {
    // MARK: Date -> String
    func toString(dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: Config.localeId)
        dateFormatter.calendar = Calendar(identifier:Calendar.Identifier.gregorian)
        dateFormatter.dateFormat = dateFormat
        
        return dateFormatter.string(from: self)
    }
}
