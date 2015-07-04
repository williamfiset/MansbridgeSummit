//
//  ExtensionsTests.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-03.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import XCTest

class ExtensionsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testStringLength() {
        
        let str1 = ""
        let str2 = "g"
        let str3 = "hello"
        
        XCTAssertEqual(str1.length, 0)
        XCTAssertEqual(str2.length, 1)
        XCTAssertEqual(str3.length, 5)
        
    }
    
    func testStringIndexing() {
        
        let str1 = "world"
        
        XCTAssertEqual(str1[0], "w")
        XCTAssertEqual(str1[1], "o")
        XCTAssertEqual(str1[2], "r")
        XCTAssertEqual(str1[3], "l")
        XCTAssertEqual(str1[4], "d")
        
    }
    
    func testStringRangeIndexing() {
        
        let str = "pinapple tree"
        
        XCTAssertEqual( str[1...4], "inap")
        XCTAssertEqual( str[0..<str.length] , str)
        XCTAssertEqual( str[0...2], "pin")
        XCTAssertEqual( str[9..<str.length], "tree")
        
    }
    
    func testStringSplit() {
        
        let str1 = "micah|will|ricker"
        let str2 = "godel-escher-bach"
        let str3 = "multi%%split%%this%%string"
        
        let str1_split = str1.split("|")
        let str2_split = str2.split("-")
        let str3_split = str3.split("%%")
        
        XCTAssertEqual(str1_split.count, 3)
        XCTAssertEqual(str2_split.count, 3)
        XCTAssertEqual(str3_split.count, 4)


        /* Depricated Test, this simply depends on the behaviour you want */
        
        //let str4 = "e"
        //let str4_split = str4.split("e")
        // XCTAssertEqual(str4_split.count, 0) // or 1?
        
    }

    func testArrayRemoveObjs() {
        
        var arr1 = ["a", "b", "c"]
        arr1.removeObject("a")
        XCTAssertEqual(arr1, ["b", "c"])

        arr1.removeObject("b")
        XCTAssertEqual(arr1, ["c"])

        arr1.removeObject("c")
        XCTAssertEqual(arr1, [])
        
        arr1.removeObject("d") // "d" doesn't exist
        XCTAssertEqual(arr1, [])
        
    }
    
}

















