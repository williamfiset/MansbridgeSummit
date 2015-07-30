//
//  MSSpeakerScollerView.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-29.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation
import UIKit


class MSSpeakerScrollView : UIScrollView {
    
    let TOP_Y : CGFloat = 50
    let PADDING : CGFloat = 20
    
    var videoPlayer1: YouTubePlayerView!
    var videoPlayer2: YouTubePlayerView!
    var videoPlayer3: YouTubePlayerView!
    
    init(frame: CGRect, withVideos videos : [String]) {
        
        super.init(frame: frame)
        
        let videoWidth = GC.SCREEN_WIDTH - (PADDING * 2)
        let videoHeight = videoWidth / 2
        
        videoPlayer1 = YouTubePlayerView(frame: CGRect(x: PADDING, y: TOP_Y + PADDING, width: videoWidth, height: videoHeight))
        videoPlayer1.loadVideoID("DBXZWB_dNsw")
        self.addSubview(videoPlayer1)
        
        videoPlayer2 = YouTubePlayerView(frame: CGRect(x: PADDING, y: TOP_Y + (2 * PADDING) + videoHeight, width: videoWidth, height: videoHeight))
        videoPlayer2.loadVideoID("0r3cEKZiLmg")
        self.addSubview(videoPlayer2)
        
        videoPlayer3 = YouTubePlayerView(frame: CGRect(x: PADDING, y: TOP_Y + (3 * PADDING) + (videoHeight * 2), width: videoWidth, height: videoHeight))
        videoPlayer3.loadVideoID("yBX8GFqt6GA")
        self.addSubview(videoPlayer3)
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}


