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
           
            if let events = json["events"].array {
                for eventBlock in events {
                    for key in eventBlock.dictionary!.keys.array {
                        
                        if (key.rangeOfString("date") != nil) {
                            
                            let date = eventBlock[key].stringValue
                            let i = key[key.length-1]
                            
                            var msevents : [MSEvent] = []
                            
                            if let events = eventBlock["events\(i)"].dictionary {
                                
                                for (_, eventDictionary) in events {
                                    
                                    let eventName = eventDictionary["eventName"].stringValue
                                    let eventTime = eventDictionary["eventTime"].stringValue
                                    let eventLocation = eventDictionary["eventLocation"].stringValue
                                    let eventDescription = eventDictionary["eventDescription"].stringValue
                                    let eventSpeaker = eventDictionary["eventSpeaker"].string
                                    
                                    let msevent = MSEvent (
                                        eventName: eventName,
                                        eventTime: eventTime,
                                        eventLocation: eventLocation,
                                        eventDescription: eventDescription,
                                        eventSpeaker: eventSpeaker
                                    )
                                    
                                    msevents.append( msevent )
                                }
                            }
                            
                            msdays.append( MSDay(date: date, events: msevents) )
                            
                        }
                        
                    }
                }
            }
        }
        
        return msdays
    }
    
    
}