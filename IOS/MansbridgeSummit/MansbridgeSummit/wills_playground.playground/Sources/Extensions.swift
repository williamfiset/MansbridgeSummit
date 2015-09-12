//
//  extensions.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-03.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation

extension String {

    /* Returns the length of a String */
    var length : Int {
        get {
            return self.characters.count
        }
    }
    
//    /* Returns a character at a specific index */
//    subscript(integerIndex: Int) -> Character {
//        let index = startIndex.advanceBy(integerIndex)
//        return self[index]
//    }
//    
//    /* Returns a substring in a given range */
//    subscript(integerRange: Range<Int>) -> String {
//        let start = startIndex.advanceBy(integerRange.startIndex)
//        let end = startIndex.advanceBy(integerRange.endIndex)
//        let range = start..<end
//        return self[range]
//    }
    
    /* returns an array of string devided a delimiter */
    func split (delimiter : String) -> [String] {
        return self.componentsSeparatedByString(delimiter)
    }
    
}

/* Allows you to remove items from an array by value */
extension Array {
    
    mutating func removeObject<U: Equatable>(object: U) {
    
        var index: Int?
        
        for (idx, objectToCompare) in self.enumerate() {
            if let to = objectToCompare as? U {
                if object == to {
                    index = idx
                }
            }
        }
        
        if(index != nil) {
            self.removeAtIndex(index!)
        }
        
    }
}





















