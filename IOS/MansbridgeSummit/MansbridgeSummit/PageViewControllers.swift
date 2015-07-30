//
//  PageContentViewController.swift
//  MansbridgeSummit
//
//  Created by Micah Stairs on 2015-07-24.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation
import UIKit

class MSFrontPageController : UIViewController {
    
    var scrollView : MSFrontPageScrollView!
    let frame = CGRectMake(0, 0, GC.SCREEN_WIDTH, GC.SCREEN_HEIGHT - GC.TAB_BAR_HEIGHT)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.scrollView = MSFrontPageScrollView(frame: frame)
        self.view.addSubview(scrollView)
        
    }
    
}

class MSSpeakerController : UIViewController {
    
    static var speakerJSONData : JSON?
    static var speakers : [MSSpeaker] = []
    
    let SPEAKER_FILE_NAME = ""
    var speakerID : Int!
    
    // Ask speakers are created this variable increments. 
    // Meaning the way you instantiate speakers will determine which 
    // speaker has which videos
    static var speakerIndex : Int = 0
    
    let frame = CGRectMake(0, 0, GC.SCREEN_WIDTH, GC.SCREEN_HEIGHT - GC.TAB_BAR_HEIGHT)
    var scrollView : MSSpeakerScrollView!
    
    init ( ) {
        
        super.init(nibName: nil, bundle: nil)
        loadSpeakerData()
        
        self.speakerID = MSSpeakerController.speakerIndex
        MSSpeakerController.speakerIndex++

    }
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let videos = getSpeakerVideos()
        print(videos)
        self.scrollView = MSSpeakerScrollView(frame: frame, withVideos: videos)
        self.view.addSubview(scrollView)
        
    }
    
    func loadSpeakerData() -> Void {
        
        if MSSpeakerController.speakerJSONData == nil {
            if let data = DataLoader(fileName: SPEAKER_FILE_NAME, fileType: "json") {
                
                MSSpeakerController.speakerJSONData = data.getJSONContent();
                let json = MSSpeakerController.speakerJSONData!
                
                if let panelists = json["panelists"].array {
                    for panelist in panelists {
                        
                        let speaker_name = panelist["name"].stringValue ?? ""
                        let speaker_profession = panelist["profession"].stringValue ?? ""
                        let speaker_short_description = panelist["description"].stringValue ?? ""
                        let speaker_videos = panelist["videos"].arrayObject as? [String] ?? []

                        let speaker = MSSpeaker(
                            name : speaker_name,
                            profession : speaker_profession,
                            short_description : speaker_short_description,
                            videos : speaker_videos
                        )
                        
                        MSSpeakerController.speakers.append(speaker)
                    }
                }
                
            }
        }
        
    }
    
    func getSpeakerVideos() -> [String] {
        if speakerID < MSSpeakerController.speakers.count  {
            return MSSpeakerController.speakers[ speakerID ].videos
        } else {
            return []
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


