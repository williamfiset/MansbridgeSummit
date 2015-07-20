//
//  ConnectionTests.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-18.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import XCTest

class ConnectionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCanConnectToMTASiteWithNetworkConnection() {
        
        let connection = Reachability(hostName: "www.mta.ca")
        if connection.isReachable() {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
        
    }
    
    // Reactive once we can set a baseline
    /*
    func testConnectionSpeed() {
        
        let connection = Reachability(hostName: "www.mta.ca")
        self.measureBlock {
            for _ in 0...100 {
                
                connection.isReachable()
                
            }
        }
    }
    */
    
}
