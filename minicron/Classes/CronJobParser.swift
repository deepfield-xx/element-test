//
//  CommandParser.swift
//  minicron
//
//  Created by Tom on 09/12/2021.
//

// =========================
// CronJobParser is reposible for preparing a output String based on
// the comand line arguments and current-time
// =========================

import Foundation

final class CronJobParser {
    private let currentDate: Date
    
    init(date: Date) {
        self.currentDate = date
    }
    
    func parse(minutes: String, hours: String, command: String) -> String? {
        if minutes == "*" {
            if hours == "*" {
                return "\(currentDate.hour):\(currentDate.minute) today - \(command)"
            } else if let hoursInt = Int(hours), hoursInt >= 0 && hoursInt <= 23 {
                let day = hoursInt < currentDate.hour ? "tomorrow" : "today"
                return "\(hoursInt):00 \(day) - \(command)"
            }
        } else if let minutesInt = Int(minutes), minutesInt >= 0 && minutesInt <= 59 {
            if hours == "*" {
                let day = currentDate.isInPast(currentDate.hour, minute: minutesInt) ? "tomorrow" : "today"
                return "\(currentDate.hour):\(minutesInt) \(day) - \(command)"
            } else if let hoursInt = Int(hours) {
                let day = currentDate.isInPast(hoursInt, minute: minutesInt) ? "tomorrow" : "today"
                return "\(hoursInt):\(minutesInt) \(day) - \(command)"
            }
        }
        
        return nil
    }
}
