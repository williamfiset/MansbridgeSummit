//
//  MansbridgeSummitUITests.swift
//  MansbridgeSummitUITests
//
//  Created by William Fiset on 2015-07-02.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//


import Foundation
import XCTest

@available(iOS 9.0, *)
class MansbridgeSummitUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        self.continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testChangingTabs() {
        
        let tabBarsQuery = XCUIApplication().tabBars
        tabBarsQuery.buttons["Register"].tap()
        tabBarsQuery.buttons["Twitter"].tap()
        tabBarsQuery.buttons["Schedule"].tap()
        tabBarsQuery.buttons["About"].tap()
        
    }
    
}
