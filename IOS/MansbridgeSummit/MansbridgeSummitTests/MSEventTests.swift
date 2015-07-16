//
//  MSEventTests.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-08.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import XCTest

class MSEventTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCreatingEventController() {
        
        let controller1 = MSEventPageController()
        XCTAssertNotNil(controller1)
        
    }
    
    func testCreatingEventPageView() {
        
        let msevent = MSEvent (
            eventName: "eventName",
            eventTime: "eventTime",
            eventLocation: "eventLocation",
            eventDescription: "eventDescription",
            eventSpeaker: "eventSpeaker"
        )
        
        let rect1 = CGRect(x: 0, y: 0, width: 300, height: 100)
        let view1 = MSEventPageView(frame: rect1, event: msevent)
        XCTAssertNotNil(view1)

        
        let rect2 = CGRect(x: 0, y: 0, width: 1, height: 1)
        let view2 = MSEventPageView(frame: rect2, event: msevent)
        XCTAssertNotNil(view2)
        
        let rect3 = CGRect(x: -100, y: -100, width: 300, height: 100)
        let view3 = MSEventPageView(frame: rect3, event: msevent)
        XCTAssertNotNil(view3)
        
        let rect4 = CGRect(x: 0, y: 0, width: 300000, height: 65785432)
        let view4 = MSEventPageView(frame: rect4, event: msevent)
        XCTAssertNotNil(view4)
        
    }

}
