//
//  MSScheduleCellView.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-04.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import XCTest

class MSScheduleCellViewTests : XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit() {
        
        let cell1 = MSScheduleCellView(eventTime: "time", eventDescription: "description", cellIdentifier: "EventCell")
        
        XCTAssertNotNil(cell1)
        
    }
    
    func testCellConsistancy() {
        
        // let tableController = MSScheduleTableController(style: .Plain)
        // Loop through json file creating cells
        
        
    }

}
