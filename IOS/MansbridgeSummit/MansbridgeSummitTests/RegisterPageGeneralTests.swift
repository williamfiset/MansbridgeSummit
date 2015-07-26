//
//  RegisterPageGeneralTests.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-21.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import XCTest

class RegisterPageGeneralTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }


    func testCreateRegisterObj() {
        XCTAssertNotNil(MSRegisterTabController())
    }

    func testCreationWalkthrough() {
        
        let controller = MSRegisterTabController()
        
        controller.viewDidLoad()
        controller.viewDidAppear(true)
        controller.webViewDidStartLoad(controller.webView)
        controller.webViewDidFinishLoad(controller.webView)
        
        if let url = NSURL(string: controller.website) {
    
            let request = NSURLRequest(URL: url)
            controller.webView(controller.webView, shouldStartLoadWithRequest: request, navigationType: .FormSubmitted)
            XCTAssert(true)

        } else {
            XCTAssert(false)
        }
        
    }
    
    func testNetworkError() {
        
        let controller = MSRegisterTabController()
        controller.connection = Reachability(hostName: "this host does not exist, I am quite sure")
        
        controller.viewDidLoad()
        controller.viewDidAppear(true)
        controller.webViewDidStartLoad(controller.webView)
        controller.webViewDidFinishLoad(controller.webView)
        
        controller.displayNetworkConnectionErrorView()
        controller.removeNetworkConnectionErrorView()
        
    }
    
    func testRequiredProtocols() {
        
        let controller = MSRegisterTabController()
        controller.viewDidLoad()
        controller.viewDidAppear(true)
        
        controller.displayNetworkConnectionErrorView()
        controller.removeNetworkConnectionErrorView()
        
        
    }

}













