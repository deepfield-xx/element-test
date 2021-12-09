//
//  DateParser.swift
//  minicron
//
//  Created by Tom on 08/12/2021.
//

// =========================
// DateParser is reposible for parsing and validating current-time
// =========================

import Foundation

final class DateParser {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    static func format(_ str: String) -> Date? {
        if let date = dateFormatter.date(from: str) {
            return Calendar.current.date(bySettingHour: date.hour, minute: date.minute, second: 0, of: Date())
        } else {
            return nil
        }
    }
}
