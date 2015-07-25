//
//  PageContentViewController.swift
//  MansbridgeSummit
//
//  Created by Micah Stairs on 2015-07-24.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {
    
    var pageIndex: Int?

}

class SpeakerViewController: PageContentViewController {
    
    var videoPlayer1: YouTubePlayerView!
    var videoPlayer2: YouTubePlayerView!
    var videoPlayer3: YouTubePlayerView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let image = UIImage(named: "Speaker\(pageIndex!)")
        let imageView = UIImageView(image: image)
        imageView.frame = self.view.frame
        self.view.addSubview(imageView)
        

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

class HomeViewController: PageContentViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let scollViewFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - GC.TAB_BAR_HEIGHT)
        let scrollView = MSScrollView(frame: scollViewFrame)
        self.view.addSubview(scrollView)
        
    }
}