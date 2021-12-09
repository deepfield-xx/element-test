//
//  minicronTests.swift
//  minicronTests
//
//  Created by Tom on 09/12/2021.
//

import XCTest
@testable import minicron

class minicronTests: XCTestCase {

    func testDateParser() throws {
        var date = DateParser.format("12:22")
        XCTAssertNotNil(date)
        XCTAssertEqual(12, date?.hour)
        XCTAssertEqual(22, date?.minute)
        
        date = DateParser.format("28:12")
        XCTAssertNil(date)
        date = DateParser.format("18:72")
        XCTAssertNil(date)
    }
    
    func testCronJobParser() throws {
        let date = DateParser.format("16:10")
        XCTAssertNotNil(date)
        
        let cronJobParser = CronJobParser(date: date!)
        var commands = "30 1 /bin/run_me_daily".components(separatedBy: " ")
        XCTAssertEqual(cronJobParser.parse(minutes: commands[0],
                                           hours: commands[1],
                                           command: commands[2]), "1:30 tomorrow - /bin/run_me_daily")
        commands = "45 * /bin/run_me_hourly".components(separatedBy: " ")
        XCTAssertEqual(cronJobParser.parse(minutes: commands[0],
                                           hours: commands[1],
                                           command: commands[2]), "16:45 today - /bin/run_me_hourly")
        commands = "* * /bin/run_me_every_minute".components(separatedBy: " ")
        XCTAssertEqual(cronJobParser.parse(minutes: commands[0],
                                           hours: commands[1],
                                           command: commands[2]), "16:10 today - /bin/run_me_every_minute")
        commands = "* 19 /bin/run_me_sixty_times".components(separatedBy: " ")
        XCTAssertEqual(cronJobParser.parse(minutes: commands[0],
                                           hours: commands[1],
                                           command: commands[2]), "19:00 today - /bin/run_me_sixty_times")
        
        commands = "* 25 /bin/run_me_sixty_times".components(separatedBy: " ")
        XCTAssertEqual(cronJobParser.parse(minutes: commands[0],
                                           hours: commands[1],
                                           command: commands[2]), nil)
        
        commands = "69 * /bin/run_me_sixty_times".components(separatedBy: " ")
        XCTAssertEqual(cronJobParser.parse(minutes: commands[0],
                                           hours: commands[1],
                                           command: commands[2]), nil)
    }
}
