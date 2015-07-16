//
//  MScheduleTableViewTests.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-08.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import XCTest

class MScheduleTableViewTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCreatingScheduleTable() {
        
        let table = MSScheduleTableView(frame: CGRect(x: 0, y: 0, width: 600, height: 1000))
        XCTAssertNotNil(table)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            for _ in 0...10 {
                MSScheduleTableView(frame: CGRect(x: 0, y: 0, width: 600, height: 1000))
            }
        }
    }

}
