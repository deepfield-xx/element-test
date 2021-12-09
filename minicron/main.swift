//
//  main.swift
//  minicron
//
//  Created by Tom on 08/12/2021.
//

import Foundation

guard let currentDate = CommandParser.extractCurrentDate(CommandLine.arguments) else {
    CommandIO.printUsage()
    exit(0)
}

let cronJobParser = CronJobParser(date: currentDate)
while let line = readLine(strippingNewline: true), line.isEmpty == false {
    let stringArray = line.split(whereSeparator: { $0 == " " }).map(String.init)
    
    if stringArray.count > 2 {
        if let output = cronJobParser.parse(minutes: stringArray[0],
                                            hours: stringArray[1],
                                            command: stringArray[2]) {
            print(output)
        } else {
            CommandIO.printUsage()
        }
    } else {
        CommandIO.printUsage()
    }
}
