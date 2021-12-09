//
//  CommandIO.swift
//  minicron
//
//  Created by Tom on 09/12/2021.
//

// =========================
// CommandIO is reposible for printing how to use the program
// =========================

import Foundation

final class CommandIO {
    class func printUsage() {
        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
        
        print("usage:")
        print("\(executableName) 30 1 /bin/run_me_daily 16:30")
    }
}
