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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.scrollView = MSFrontPageScrollView(frame: CGRectMake(0, 0, GC.SCREEN_WIDTH, GC.SCREEN_HEIGHT - GC.TAB_BAR_HEIGHT))
        self.view.addSubview(scrollView)
        
    }
    
}

class MSSpeakerController : UIViewController {
    
    var videoPlayer1: YouTubePlayerView!
    var videoPlayer2: YouTubePlayerView!
    var videoPlayer3: YouTubePlayerView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let topY = 50
        let padding = 20
        let width = Int(self.view.frame.width)
        let videoWidth = width - (padding * 2)
        let videoHeight = videoWidth / 2
        
        videoPlayer1 = YouTubePlayerView(frame: CGRect(x: padding, y: topY + padding, width: videoWidth, height: videoHeight))
        videoPlayer1.loadVideoID("DBXZWB_dNsw")
        self.view.addSubview(videoPlayer1)
        
        videoPlayer2 = YouTubePlayerView(frame: CGRect(x: padding, y: topY + (2 * padding) + videoHeight, width: videoWidth, height: videoHeight))
        videoPlayer2.loadVideoID("0r3cEKZiLmg")
        self.view.addSubview(videoPlayer2)
        
        videoPlayer3 = YouTubePlayerView(frame: CGRect(x: padding, y: topY + (3 * padding) + (videoHeight * 2), width: videoWidth, height: videoHeight))
        videoPlayer3.loadVideoID("yBX8GFqt6GA")
        self.view.addSubview(videoPlayer3)
        
        
    }
    
}


