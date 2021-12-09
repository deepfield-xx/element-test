//
//  CommandParser.swift
//  minicron
//
//  Created by Tom on 09/12/2021.
//

// =========================
// CommandParser is reposible for parsing and validating current-time
// =========================

import Foundation

final class CommandParser {
    class func extractCurrentDate(_ args: [String]) -> Date? {
        guard args.count > 1 else {
            return nil
        }
        
        return DateParser.format(args[1])
    }
}
