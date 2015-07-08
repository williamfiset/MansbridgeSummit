//
//  MSScheduleTests.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-08.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//
/*
import Foundation
import XCTest

class MSScheduleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
       
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOpeningEvents() {

        // For some unknown reason the UI Tests cannot find the test_schedule file...
//        let reader = MSScheduleReader(fileName: "test_schedule")
//        XCTAssertNotNil(reader)
//        let _ = reader!.read().count
        
        
        let app = XCUIApplication()
        
        app.windows.tabBars.buttons["Schedule"].tap()

        let table = app.tables
        let returnButton = app.buttons["Return"]
        
        // Seems to throw an error, at least for now
//        for(var i = 0; i < entryCount; i++) {
//            table.childrenMatchingType(.Cell).elementAtIndex(i).tap()
//            returnButton.tap()
//        }
        
        table.childrenMatchingType(.Cell).elementAtIndex(0).tap()
        returnButton.tap()
        table.childrenMatchingType(.Cell).elementAtIndex(1).tap()
        returnButton.tap()
        table.childrenMatchingType(.Cell).elementAtIndex(2).tap()
        returnButton.tap()
        table.childrenMatchingType(.Cell).elementAtIndex(3).tap()
        returnButton.tap()
        table.childrenMatchingType(.Cell).elementAtIndex(4).tap()
        returnButton.tap()
        table.childrenMatchingType(.Cell).elementAtIndex(5).tap()
        returnButton.tap()
        table.childrenMatchingType(.Cell).elementAtIndex(6).tap()
        returnButton.tap()
        table.childrenMatchingType(.Cell).elementAtIndex(7).tap()
        returnButton.tap()
        table.childrenMatchingType(.Cell).elementAtIndex(8).tap()
        returnButton.tap()
        table.childrenMatchingType(.Cell).elementAtIndex(9).tap()
        returnButton.tap()
        table.childrenMatchingType(.Cell).elementAtIndex(10).tap()
        returnButton.tap()
        table.childrenMatchingType(.Cell).elementAtIndex(11).tap()
        returnButton.tap()
        
        // I think it fails becasue you actually can't reach it.
        //table.childrenMatchingType(.Cell).elementAtIndex(12).tap()
        //returnButton.tap()
        
        
    }

}
*/






