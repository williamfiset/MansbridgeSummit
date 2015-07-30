//
//  MSSpeakerModel.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-29.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation


public struct MSSpeaker : CustomStringConvertible {
    
    let name : String
    let profession : String
    let short_description : String
    let videos : [String]
    
    public var description : String {
        return "\nname: \(name)\nprofession: \(profession)\nshort_description: \(short_description)\nvideos: \(videos)\n\n"
    }
    
}
