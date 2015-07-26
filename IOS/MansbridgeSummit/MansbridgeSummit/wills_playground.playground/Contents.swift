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


public struct MSDay {
    
    let date : String
    let events : [MSEvent]

}

public struct MSEvent : CustomStringConvertible {
    
    let eventName : String
    let eventTime : String
    let eventLocation : String
    let eventDescription : String
    let eventSpeaker : String?
    
    public var description : String {
        return "eventName: \(eventName)\n, eventTime: \(eventTime)\n, eventLocation: \(eventLocation)\n, eventDescription: \(eventDescription)\n, eventSpeaker: \(eventSpeaker)\n"
    }
    
}


if let path : String = NSBundle.mainBundle().pathForResource("test_schedule", ofType: "json") {
    if let data = NSData(contentsOfFile: path) {
        
        var msdays : [MSDay] = []
        let json = JSON(data: data)
        
        if let schedule = json["schedule"].array {
            
            for day in schedule {
                
                let date   = day["date"].string
                let events = day["events"].arrayValue
                
                for event in events {
                    
                    let eventName = event["eventName"].stringValue
                    let eventTime = event["eventTime"].stringValue
                    let eventLocation = event["eventLocation"].stringValue
                    let eventDescription = event["eventDescription"].stringValue
                    let eventSpeaker = event["eventSpeaker"].string
                    
                }
            }
        }
        
    }
    
}









