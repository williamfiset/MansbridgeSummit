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
    
    func testTableControllerRequiredMethods() {
        
        let table = MSScheduleTableView(frame: CGRect(x: 0, y: 0, width: 300, height: 900))
        
        let controller1 = MSScheduleTableController(style: .Grouped)
        
        controller1.viewWillAppear(true)
        controller1.viewDidLoad()
        
        let firstCell = NSIndexPath(forRow: 0, inSection: 0)
        
        controller1.tableView(table, cellForRowAtIndexPath: firstCell)
        controller1.tableView(table, didSelectRowAtIndexPath: firstCell)
        controller1.tableView(table, viewForHeaderInSection: 0)
        controller1.tableView(table, titleForHeaderInSection: 0)
        controller1.tableView(table, numberOfRowsInSection: 0)
        
    }
    
    func testRowsInSections() {
        
        let table = MSScheduleTableView(frame: CGRect(x: 0, y: 0, width: 300, height: 900))
        
        let controller1 = MSScheduleTableController(style: .Grouped)
        controller1.schedule_file_name = "test_schedule"
        
        controller1.viewWillAppear(true)
        controller1.viewDidLoad()
        
        var rows = controller1.tableView(table, numberOfRowsInSection: 0)
        XCTAssertEqual(rows, 3);
        
        rows = controller1.tableView(table, numberOfRowsInSection: 1)
        XCTAssertEqual(rows, 2);
        
        rows = controller1.tableView(table, numberOfRowsInSection: 2)
        XCTAssertEqual(rows, 4);
        
        rows = controller1.tableView(table, numberOfRowsInSection: 3)
        XCTAssertEqual(rows, 4);
        
    }

}














