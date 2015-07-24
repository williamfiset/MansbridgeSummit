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
    let eventSpeaker : String?
    
    public var description : String {
        let speaker = eventSpeaker == nil ? "nil" : eventSpeaker!
        return "eventName: \(eventName)\neventTime: \(eventTime)\neventLocation: \(eventLocation)\neventDescription: \(eventDescription)\neventSpeaker: \(speaker)\n"
    }
    
}


public class MSScheduleReader {
    
    let fileName : String
    var scheduleData : JSON? = nil
    
    init? (fileName : String) {
        
        self.fileName = fileName
        
        if let path : String = NSBundle.mainBundle().pathForResource(fileName, ofType: "json") {
            if let data = NSData(contentsOfFile: path) {
                scheduleData =  JSON(data: data)
            } else {
                return nil
            }
        } else {
            return nil
        }

    }
    
    public func read() -> [MSDay] {
        
        var msdays : [MSDay] = []
        
        if let json = scheduleData {
           
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
                        let eventSpeaker = event["eventSpeaker"].string
                        
                        let msevent = MSEvent (
                            eventName: eventName,
                            eventTime: eventTime,
                            eventLocation: eventLocation,
                            eventDescription: eventDescription,
                            eventSpeaker: eventSpeaker
                        )
                        
                        msevents.append( msevent )
                    }
                    msdays.append( MSDay(date: date, events: msevents) )
                }
            }
        }
        
        return msdays
    }
    
    
}