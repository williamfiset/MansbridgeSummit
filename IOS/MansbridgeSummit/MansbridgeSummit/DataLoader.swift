//
//  MSScheduleReader.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-29.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation

public class DataLoader {
    
    let fileName : String
    let fileType : String
    
    var fileData : NSData?
    
    // E.g:  DataLoader("test_schedule", "json")
    init? ( fileName: String, fileType: String) {
        
        self.fileName = fileName
        self.fileType = fileType
        
        if let path : String = NSBundle.mainBundle().pathForResource(fileName, ofType: fileType) {
            if let data = NSData(contentsOfFile: path) {
                self.fileData = data
            } else {
                return nil
            }
        } else {
            return nil
        }
        
    }
    
    func getJSONContent() -> JSON? {
        
        if fileData != nil {
            return JSON(data: fileData!)
        } else {
            return nil
        }
        
    }
    
}





