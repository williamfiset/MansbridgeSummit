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
    
    var frontPageView : MSFrontPageScrollView!
    let frame = CGRectMake(0, 0, GC.SCREEN_WIDTH, GC.SCREEN_HEIGHT - GC.TAB_BAR_HEIGHT)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.frontPageView = MSFrontPageScrollView(frame: frame)
        self.view.addSubview(frontPageView)
        
        addSpeakerTouchEvents()
        
        
    }
    
    private func addSpeakerTouchEvents() {
        
        for speakerButton in frontPageView.speakerButtons {
            speakerButton.addTarget(self, action: "pressedSpeaker:", forControlEvents: UIControlEvents.TouchDown)
        }
       
    }
    
    func pressedSpeaker(speakerButton : UIButton) {
    
        let speakerIndex = speakerButton.tag
        
        if let parentController = self.parentViewController as? UIPageViewController {
            if let viewControllerModel = parentController.dataSource as? MSHomeModelController {

                let nextViewController = viewControllerModel.viewControllerAtIndex( speakerIndex+1 )
                parentController.setViewControllers( [nextViewController], direction: .Forward, animated: true, completion: {done in})

                
                // Animates swiping through all the pages
                //                func progessiveAnimate( currIndex : Int, finalIndex : Int ) {
                //                    let nextViewController = viewControllerModel.viewControllerAtIndex( currIndex )
                //                    parentController.setViewControllers( [nextViewController], direction: .Forward, animated: true, completion: {done in
                //                        if (currIndex != finalIndex) {
                //                            progessiveAnimate (currIndex+1, finalIndex: finalIndex)
                //                        }
                //                    })
                //                }
                //                
                //                progessiveAnimate(1, finalIndex: speakerIndex+1)

                
            }
        }
        
    }
    
}

class MSSpeakerController : UIViewController {
    
    static var speakerJSONData : JSON?
    static var speakers : [MSSpeaker] = []
    
    let SPEAKER_FILE_NAME = ""
    
    // As speakers are created this variable increments.
    // Meaning the way you instantiate speakers will determine which 
    // speaker has which videos
    static var speakerIndex : Int = 0
    var speakerIndex : Int!
    
    let frame = CGRectMake(0, 0, GC.SCREEN_WIDTH, GC.SCREEN_HEIGHT - GC.TAB_BAR_HEIGHT)
    var scrollView : MSSpeakerScrollView!
    
    init ( ) {
        
        super.init(nibName: nil, bundle: nil)
        loadSpeakerData()
        
        self.speakerIndex = MSSpeakerController.speakerIndex
        MSSpeakerController.speakerIndex++

    }
   
    override func viewDidLoad() {
        
        super.viewDidLoad()

        var speaker = getPageSpeaker()
        self.scrollView = MSSpeakerScrollView(frame: frame, withSpeaker: &speaker)
        self.view.addSubview(scrollView)
        
    }
    
    func loadSpeakerData() -> Void {
        
        if MSSpeakerController.speakerJSONData == nil {
            if let data = DataLoader(fileName: SPEAKER_FILE_NAME, fileType: "json") {
                
                MSSpeakerController.speakerJSONData = data.getJSONContent();
                let json = MSSpeakerController.speakerJSONData!
                
                if let panelists = json["panelists"].array {
                    for panelist in panelists {
                        
                        let speaker_name = panelist["name"].string ?? ""
                        let speaker_profession = panelist["profession"].string ?? ""
                        let speaker_short_description = panelist["description"].string ?? ""
                        let speaker_videos = (panelist["videos"].arrayObject ?? []) as! [String]

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
    
    func getPageSpeaker() -> MSSpeaker? {
        if speakerIndex < MSSpeakerController.speakers.count  {
            return MSSpeakerController.speakers[ speakerIndex ]
        } else {
            return nil
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


