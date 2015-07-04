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
    
}
