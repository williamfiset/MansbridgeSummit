//
//  MSScrollView.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-12.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation
import UIKit

public class MSFrontPageScrollView : UIView {

    let homePageVideo = "ZhnhnKV56mA"
    
    var headerImageView : UIImageView!
    var videoPlayerView : YouTubePlayerView!
    
    var speakerButtons : [UIButton] = []
    
    let PADDING : CGFloat = 15;
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = GC.Color.white
        
        addHeaderImage()
        addYoutubeThumbnail()
        addStreamLink()
        
    }
    
    private func addHeaderImage() -> Void {
        
        let headerImg = UIImage(named: "MansbrideSummitpresents")
        headerImageView = UIImageView(image: headerImg)
        headerImageView.frame = CGRect(x: 0, y: 0, width: GC.SCREEN_WIDTH, height: GC.SCREEN_HEIGHT * 0.25)
        addSubview(headerImageView)
        
    }

    
    private func addYoutubeThumbnail() {

        let y = headerImageView.frame.origin.y + headerImageView.frame.height + PADDING
        
        let frame = CGRectMake( PADDING, y ,  GC.SCREEN_WIDTH - 2*PADDING, GC.SCREEN_HEIGHT * 0.25)
        videoPlayerView = YouTubePlayerView(frame: frame)
        videoPlayerView.loadVideoID( homePageVideo )
        self.addSubview(videoPlayerView)
        
    }
    
    private func addStreamLink(  ) -> Void {
        
        // Not usre what this should be. A button? A label? A sexy animation?
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
