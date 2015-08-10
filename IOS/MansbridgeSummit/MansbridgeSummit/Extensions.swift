//
//  extensions.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-03.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    /* Returns the length of a String */
    var length : Int {
        get {
            return self.characters.count
        }
    }
    
    /* Returns a character at a specific index */
    subscript(integerIndex: Int) -> Character {
        let index = advance(startIndex, integerIndex)
        return self[index]
    }
    
    /* Returns a substring in a given range */
    subscript(integerRange: Range<Int>) -> String {
        let start = advance(startIndex, integerRange.startIndex)
        let end = advance(startIndex, integerRange.endIndex)
        let range = start..<end
        return self[range]
    }
    
    /* Returns an array of strings divided by a delimiter */
    func split (delimiter : String) -> [String] {
        return self.componentsSeparatedByString(delimiter)
    }
    
    func startAt(start : String) -> String? {
        
        let range = self.rangeOfString(start)
        
        if (range != nil) {
            return self.substringFromIndex(range!.endIndex)
        }
        
        return nil;
        
    }
    
    func endAt(end : String) -> String? {
        
        let range = self.rangeOfString(end)
        
        if (range != nil) {
            return self.substringToIndex(range!.startIndex)
        }
        
        return nil;
        
    }
    
    mutating func replace(string: String, replacement : String) {
        
        let range = self.rangeOfString(string)
        
        if (range != nil) {
            self.replaceRange(range!, with: replacement)
        }
        
    }
    
    mutating func replaceAll(string: String, replacement : String) {
        
        var range = self.rangeOfString(string)
        
        while (range != nil) {
            self.replaceRange(range!, with: replacement)
            range = self.rangeOfString(string)
        }
        
    }
    
    mutating func removeSubstringIfExists(string : String) {
        let range = self.rangeOfString(string)
        if (range != nil) {
            self.removeRange(range!)
        }
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
/*
extension Boolean : BooleanType {
    public var boolValue : Bool {
        return self != 0
    }
}
*/

extension UIView {
    
    // Loads a NIB/XIB file
    class func loadFromNibNamed(nibNamed: String, bundle : NSBundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
        ).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
    
}










