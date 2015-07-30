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
    let PADDING : CGFloat = GC.SCREEN_WIDTH * 0.025
    
    init(frame: CGRect, inout withSpeaker speaker : MSSpeaker? ) {
        
        super.init(frame: frame)
        
        if speaker != nil {
            positionSpeakerText(&speaker!)
            positionVideos(&speaker!)
        }

        
    }
    
    private func positionSpeakerText( inout speaker : MSSpeaker ) -> Void {
        
    }
    
    private func positionVideos( inout speaker : MSSpeaker ) -> Void {
        
        let videoWidth = GC.SCREEN_WIDTH - (PADDING * 2)
        let videoHeight = videoWidth / 2
        
        for ( var i : CGFloat = 0; Int(i) < speaker.videos.count; i++) {
            
            let frame = CGRectMake( PADDING, TOP_Y + (i+1)*PADDING + i*videoHeight , videoWidth, videoHeight)
            let videoPlayer = YouTubePlayerView(frame: frame)
            videoPlayer.loadVideoID( speaker.videos[Int(i)] )
            self.addSubview(videoPlayer)
            
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}


