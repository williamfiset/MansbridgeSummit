//
//  MSScheduleJSONTests.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-04.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import XCTest

class MSScheduleJSONTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Make sure file exists and that hte data can be accessed
    func testScheduleFileExists() {
        
        let reader = MSScheduleReader(fileName: "test_schedule")
        let reader2 = MSScheduleReader(fileName: "this filename does not exists")
        
        XCTAssertNotNil(reader)
        XCTAssertNil(reader2)
        
    }
    
    // Make sure the test schedule could be parsed properly
    func testScheduleFileContent() {
        
        let reader = MSScheduleReader(fileName: "test_schedule")
        if let days = reader?.read() {
            
            XCTAssertNotEqual(days.count, 0)
            
            for day in days {
                
                XCTAssertNotEqual(day.events.count, 0)
                
                for event in day.events {
                    
                    XCTAssertNotEqual(event.eventDescription, "")
                    XCTAssertNotEqual(event.eventLocation, "")
                    XCTAssertNotEqual(event.eventName, "")
                    XCTAssertNotEqual(event.eventSpeaker == nil ? "nil" : event.eventSpeaker!, "")
                    XCTAssertNotEqual(event.eventTime, "")
                    
                    if event.eventName == "The meaning of life" {
                        XCTAssertNil(event.eventSpeaker)
                    }
                    
                    if event.eventDescription == "Learning how to paint the Starry Night with Oil paints at Dawn" {
                        XCTAssertEqual(event.eventSpeaker!, "Vincent Van Gogh")
                    }
                    
                    if event.eventDescription == "A taste of evolution" {
                        XCTAssertEqual(event.eventLocation, "Hart Hall top floor conference room")
                    }
                    
                }
            }
            
        } else {
            XCTFail()
        }
        
    }
    
    // Make sure the schedule from the last Mansbridge Summit is displayed in the correct order
    func testScheduleOrder() {
        
        let reader = MSScheduleReader(fileName: "test_schedule2")
        if let days = reader?.read() {
            
            XCTAssertEqual(days.count, 2)
            
            for (var d = 0; d < days.count; d++) {
                
                let day = days[d]
                
                XCTAssertNotEqual(day.events.count, 0)
                
                for (var e = 0; e < day.events.count; e++) {
                    
                    let event = day.events[e]
                    
                    // Check the first day
                    if (d == 0) {
                        
                        if (e == 0 ) {
                            XCTAssertEqual(event.eventTime, "7:00pm")
                        }
                    
                    // Check the second day
                    } else if (d == 1) {
                        
                        switch (e) {
                            
                            case 0:
                                XCTAssertEqual(event.eventTime, "8:30am")
                                break
                            
                            case 1:
                                XCTAssertEqual(event.eventTime, "9:45am-12:00pm")
                                break
                            
                            case 2:
                                XCTAssertEqual(event.eventTime, "12:25pm")
                                break
                            
                            case 3:
                                XCTAssertEqual(event.eventTime, "1:30pm")
                                break
                            
                            case 4:
                                XCTAssertEqual(event.eventTime, "2:30pm")
                                break
                                
                            case 5:
                                XCTAssertEqual(event.eventTime, "3:30pm")
                                break
                                
                            case 6:
                                XCTAssertEqual(event.eventTime, "4:30pm")
                                break
                            
                            case 7:
                                XCTAssertEqual(event.eventTime, "7:00-8:30pm")
                                break
                                
                            case 8:
                                XCTAssertEqual(event.eventTime, "9:00pm")
                                break
                            
                            default:
                                break
                            
                        }
                        
                    }
                    
                }
            }
            
        } else {
            XCTFail()
        }
        
    }

}
