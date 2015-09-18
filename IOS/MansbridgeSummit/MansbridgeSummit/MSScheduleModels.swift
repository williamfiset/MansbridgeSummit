//
//  MSCellModels.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-04.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation



public struct MSDay {
    
    let date : String
    let events : [MSEvent]

}

public struct MSEvent : CustomStringConvertible {
    
    let eventName : String
    let eventTime : String
    let eventLocation : String
    let eventDescription : String
    
    public var description : String {
        return "eventName: \(eventName)\neventTime: \(eventTime)\neventLocation: \(eventLocation)\neventDescription: \(eventDescription)\n"
    }
    
}

// Should this function belong in this file?
public func readSchedule( json : JSON ) -> [MSDay] {
    
    var msdays : [MSDay] = []
    
    if let schedule = json["schedule"].array {
        
        for day in schedule {
            
            let date   = day["date"].stringValue
            let events = day["events"].arrayValue
            var msevents : [MSEvent] = []
            
            for event in events {
                
                let eventName = event["eventName"].stringValue
                let eventTime = event["eventTime"].stringValue
                let eventLocation = event["eventLocation"].stringValue
                let eventDescription = event["eventDescription"].stringValue
                
                let msevent = MSEvent (
                    eventName: eventName,
                    eventTime: eventTime,
                    eventLocation: eventLocation,
                    eventDescription: eventDescription
                )
                
                msevents.append( msevent )
            }
            msdays.append( MSDay(date: date, events: msevents) )
        }
    }
    
    
    return msdays
}


