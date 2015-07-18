//
//  Constants.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-03.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import XCTest

class Constants: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFontsAreNotNil() {
        
        XCTAssertNotNil( GC.Font.garamond_12 )
        XCTAssertNotNil( GC.Font.garamond_14 )
        XCTAssertNotNil( GC.Font.garamond_16 )
        XCTAssertNotNil( GC.Font.garamond_18 )
        
        XCTAssertNotNil( GC.Font.garamond_bold_12 )
        XCTAssertNotNil( GC.Font.garamond_bold_14 )
        XCTAssertNotNil( GC.Font.garamond_bold_16 )
        XCTAssertNotNil( GC.Font.garamond_bold_18 )
        
        XCTAssertNotNil( GC.Font.myraidpro_12 )
        XCTAssertNotNil( GC.Font.myraidpro_14 )
        XCTAssertNotNil( GC.Font.myraidpro_16 )
        XCTAssertNotNil( GC.Font.myraidpro_18 )
        
        XCTAssertNotNil( GC.Font.myraidpro_bold_12 )
        XCTAssertNotNil( GC.Font.myraidpro_bold_14 )
        XCTAssertNotNil( GC.Font.myraidpro_bold_16 )
        XCTAssertNotNil( GC.Font.myraidpro_bold_18 )
        
    }

    func testColorsAreNotNil() {
        
        XCTAssertNotNil( GC.Color.red )
        XCTAssertNotNil( GC.Color.gold )
        
    }
    
    func testTabBarHeight () {
        XCTAssertGreaterThan( GC.TAB_BAR_HEIGHT, 0)
    }

}
