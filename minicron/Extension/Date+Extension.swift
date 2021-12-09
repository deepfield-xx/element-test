//
//  Date+Extension.swift
//  minicron
//
//  Created by Tom on 09/12/2021.
//

import Foundation

extension Date {
    var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }
    
    var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }
    
    func isInPast(_ hour: Int, minute: Int) -> Bool {
        return hour < self.hour || (self.hour == hour && self.minute > minute)
    }
}
