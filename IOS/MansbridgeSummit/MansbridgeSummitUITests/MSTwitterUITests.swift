//
//  MSTwitterUITests.swift
//  MansbridgeSummit
//
//  Created by Micah Stairs on 2015-08-13.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import XCTest
import Darwin

@available(iOS 9.0, *)
class MSTwitterUITests: XCTestCase {
    
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

//    func testExample() {
//        // Use recording to get started writing UI tests.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        
//        let app = XCUIApplication()
//        
//        
//        var counter = 0;
//        
//        while (true) {
//            
//            app.tabBars.buttons["Twitter"].tap()
//            print(counter++)
//            app.tabBars.buttons["Home"].tap()
//            
//        }
//        
//    }

}
