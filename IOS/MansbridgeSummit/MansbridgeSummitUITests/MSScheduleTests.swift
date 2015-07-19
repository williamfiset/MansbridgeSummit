//
//  MSScheduleTests.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-08.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation
import XCTest

@available(iOS 9.0, *)
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

        let app = XCUIApplication()
        
        app.windows.tabBars.buttons["Schedule"].tap()

        let table = app.tables
        let returnButton = app.buttons["Return"]
        
        let entryCount = table.childrenMatchingType(.Cell).count
        
        for(var i: UInt = 0; i < entryCount; i++) {
            table.childrenMatchingType(.Cell).elementAtIndex(i).tap()
            returnButton.tap()
        }
        
    }

}







