//
//  MSScheduleTableControllerTests.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-04.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import XCTest

class MSScheduleTableControllerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit() {
        
        let controller1 = MSScheduleTableController(style: .Grouped)
        let controller2 = MSScheduleTableController(style: .Plain)
        
        XCTAssertNotNil(controller1)
        XCTAssertNotNil(controller2)
        
    }
    
    func testViewDidLoad() {
        let controller1 = MSScheduleTableController(style: .Grouped)
        controller1.viewDidLoad()
    }
    
    func testViewDidAppear() {
        let controller1 = MSScheduleTableController(style: .Grouped)
        controller1.viewDidAppear(true)
    }
    

}
