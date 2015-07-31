//
//  MSHomePage.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-30.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import XCTest

class MSHomePage: XCTestCase {

    override func setUp() {
        
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // Make sure these static vars gets touched
        MSSpeakerController.speakers = []
        MSSpeakerController.speakerJSONData = nil
        MSSpeakerController.speakerIndex = 0
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCreatingHomeController() {

        let c = MSHomeController()
        c.viewDidLoad()
        XCTAssert(true)
        
    }

    func testHomeControllerModelProperties() {
        
        let model = MSHomeModelController()
        
        // We should only have five pages
        XCTAssertEqual(model.MAX_PAGES, 5)
        
        for i in 0..<model.MAX_PAGES {
            XCTAssertNotNil( model.viewControllerAtIndex(i) )
        }
        
    }
    
    func testSpeakerControllerFunctionality () {
        
        let controller1 = MSSpeakerController()
        let controller2 = MSSpeakerController()
        let controller3 = MSSpeakerController()
        let controller4 = MSSpeakerController()
        
        controller1.viewDidLoad()
        
        XCTAssertEqual(MSSpeakerController.speakers.count, 4)
        XCTAssertEqual(controller1.speakerIndex, 0)
        
        controller2.viewDidLoad()
        
        XCTAssertEqual(MSSpeakerController.speakers.count, 4)
        XCTAssertEqual(controller2.speakerIndex, 1)
        
        controller3.viewDidLoad()
        
        XCTAssertEqual(MSSpeakerController.speakers.count, 4)
        XCTAssertEqual(controller3.speakerIndex, 2)
        
        controller4.viewDidLoad()
        
        XCTAssertEqual(MSSpeakerController.speakers.count, 4)
        XCTAssertEqual(controller4.speakerIndex, 3)
        
    }
    
}









