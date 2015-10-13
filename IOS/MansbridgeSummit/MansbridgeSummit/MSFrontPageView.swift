//
//  MSScrollView.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-12.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation
import UIKit

public class MSFrontPageView : UIView {

    let homePageVideo = "ZhnhnKV56mA"
    
    var headerImageView : UIImageView!
    var videoPlayerView : YouTubePlayerView!
    
    var streamButton : UIButton!
    
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
    
    func refreshVideos() -> Void {
        videoPlayerView.loadVideoID(homePageVideo)
        print("re-loaded front page video")
    }
    
    private func addYoutubeThumbnail() {
        
        let x = PADDING
        let y = headerImageView.frame.origin.y + headerImageView.frame.height
        let w = GC.SCREEN_WIDTH - 2*x
        let h = GC.SCREEN_HEIGHT * 0.25
        

        let frame = CGRectMake(x, y, w, h)
        videoPlayerView = YouTubePlayerView(frame: frame)
        //videoPlayerView.loadVideoID(homePageVideo)
        //self.addSubview(videoPlayerView)
        
        // This is the added code for the tanks
        let img = UIImage(named: "tmp_twitter_tanks")
        let imgView = UIImageView(image: img)
        imgView.frame = frame;
        
        self.addSubview(imgView)
        
    }
    
    
    private func addStreamLink() -> Void {
        
        let x = PADDING
        let y = videoPlayerView.frame.origin.y + videoPlayerView.frame.height + PADDING
        let w = GC.SCREEN_WIDTH - x*2
        let h = GC.SCREEN_HEIGHT * 0.2
        
        let btnFrame = CGRectMake(x, y, w, h)
        let mtaLiveStreamImg = UIImage(named: "MTALiveLogo")
        
        streamButton = UIButton(frame: btnFrame)
        streamButton.backgroundColor = UIColor.clearColor()
        streamButton.setBackgroundImage(mtaLiveStreamImg, forState: .Normal)

        streamButton.layer.borderWidth = 2.0
        streamButton.layer.borderColor = UIColor.grayColor().CGColor
        streamButton.layer.masksToBounds = true
        
        self.addSubview(streamButton)
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
