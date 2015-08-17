//
//  MSSpeakerScollerView.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-29.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation
import UIKit


class MSSpeakerScrollView : UIScrollView { // UIScrollViewDelegate
    
    let TOP_Y = CGFloat(50)
    let PADDING : CGFloat = 15
    let HEADER_HEIGHT = 35
    
    var nameLabel : UILabel!
    var speakerImage : UIImageView!
    var descriptionLabel : UILabel!
    var professionLabel : UILabel!
    
    var bottomOfVideos : CGFloat!
    
    init(frame: CGRect, inout withSpeaker speaker : MSSpeaker?) {
        
        super.init(frame: frame)
        
        self.backgroundColor = GC.Color.white
        self.showsVerticalScrollIndicator = true
        self.scrollEnabled = true;
        self.userInteractionEnabled = true;
        self.indicatorStyle = UIScrollViewIndicatorStyle.Black
        
        if speaker != nil {
            
            createSpeakerNameLabel(&speaker!)
            createSpeakerImage(&speaker!)
            createSpeakerVideos(&speaker!)
            createSpeakerBio(&speaker!)
            
        }
        
    }
    
    // Create a title at the top with the speaker's name
    private func createSpeakerNameLabel(inout speaker : MSSpeaker) -> Void {
        
        let nameFrame = CGRectMake(0, 0, GC.SCREEN_WIDTH, 75)
        
        nameLabel = UILabel(frame: nameFrame)
        nameLabel.text = speaker.name
        nameLabel.textAlignment = .Center
        nameLabel.font = GC.Font.garamond_30
        nameLabel.textColor = GC.Color.white
        nameLabel.backgroundColor = GC.Color.red
        
        self.addSubview(nameLabel)
        
    }
    
    // Create image and short description
    private func createSpeakerImage(inout speaker : MSSpeaker) -> Void {
        
        let img = UIImage(named: speaker.image_name)
        
        let x = CGFloat(0)
        let y = nameLabel.frame.height
        
        // Caclulate height of image in order to maintain aspect ratio
        var w = GC.SCREEN_WIDTH
        var h = ((w/(img?.size.width)!) * (img?.size.height)!)
        w /= 2
        h /= 2
        
        let imgFrame = CGRectMake(x, y, w, h)
        let paddedFrame = CGRectInset(imgFrame, PADDING, PADDING)
        
        let imageView = UIImageView(image: img)
        imageView.frame = paddedFrame
        imageView.layer.borderColor = UIColor.blackColor().CGColor
        imageView.layer.borderWidth = 1
        self.speakerImage = imageView
        
        self.addSubview(imageView)
        
        let professionLabelFrame = CGRectMake(w, y, w, h)
        let professionLabelFrameInset = CGRectInset(professionLabelFrame, PADDING, 0)
        
        professionLabel = UILabel(frame: professionLabelFrameInset)
        professionLabel.text = speaker.profession
        professionLabel.textAlignment = .Center
        professionLabel.font = GC.Font.myraidpro_16
        professionLabel.lineBreakMode = NSLineBreakMode.ByClipping
        professionLabel.numberOfLines = 0 // unlimited lines
        
        self.addSubview(professionLabel)
        
    }
    
    // Add videos
    private func createSpeakerVideos(inout speaker : MSSpeaker) -> Void {
        
        // Special case if there are no videos
        if (speaker.videos.count == 0) {
            bottomOfVideos = professionLabel.frame.maxY
            return
        }
        
            /* Video Header */
        
        let x = CGFloat(0)
        let w = CGFloat(GC.SCREEN_WIDTH)
        var y = professionLabel.frame.maxY
        let h = CGFloat(35)
        
        let bioHeader = UILabel(frame: CGRectMake(x, y, w, h))
       
        if (speaker.videos.count > 1) {
            bioHeader.text = "Videos"
        } else {
             bioHeader.text = "Video"
        }
        bioHeader.font = GC.Font.myraidpro_24
        bioHeader.textColor = GC.Color.white
        bioHeader.backgroundColor = GC.Color.gold
        bioHeader.textAlignment = .Center
        
        self.addSubview(bioHeader)

            /* Videos */
        
        y += 35
        let videoWidth = GC.SCREEN_WIDTH - (PADDING * 2)
        let videoHeight = videoWidth / 2
        
        for (var i : CGFloat = 0; Int(i) < speaker.videos.count; i++) {
            
            y += PADDING
            
            let frame = CGRectMake(x + PADDING, y, videoWidth, videoHeight)
            let videoPlayer = YouTubePlayerView(frame: frame)
            videoPlayer.loadVideoID( speaker.videos[Int(i)] )
            self.addSubview(videoPlayer)
            
            y += videoHeight
            
            bottomOfVideos = y + PADDING
            
        }
        
    }
    
    // Add full bio
    private func createSpeakerBio (inout speaker : MSSpeaker) -> Void {
    
            /* Bio Header */
        
        let x = CGFloat(0)
        let w = CGFloat(GC.SCREEN_WIDTH)
        var y = bottomOfVideos
        var h = CGFloat(35)
        
        let bioHeader = UILabel(frame: CGRectMake(x, y, w, h))
        bioHeader.text = "Biography"
        bioHeader.font = GC.Font.myraidpro_24
        bioHeader.textColor = GC.Color.white
        bioHeader.backgroundColor = GC.Color.gold
        bioHeader.textAlignment = .Center
        
            /* Bio Description */
        
        y = bioHeader.frame.origin.y + h
        let font = GC.Font.myraidpro_14!
        h = heightForView(speaker.short_description, font: font, width: w - (2*PADDING)) + (2*PADDING)
        
        let descriptionLabelFrame = CGRectMake(x, y, w, h)
        let descriptionLabelFrameInset = CGRectInset(descriptionLabelFrame, PADDING, PADDING)
        
        descriptionLabel = UILabel(frame: descriptionLabelFrameInset)
        descriptionLabel.text = speaker.short_description
        descriptionLabel.textAlignment = .Left
        descriptionLabel.font = font
        descriptionLabel.numberOfLines = 0 // unlimited lines
        
        self.addSubview(bioHeader)
        self.addSubview(descriptionLabel)
        
        // Compute minimum height and set content size (ensuring that the content isn't stuck under the dots)
        self.contentSize = CGSize(width: frame.width, height: descriptionLabelFrame.maxY + Dot.DIAMETER)
        
    }
    
    // Calculate the height needed
    func heightForView(text : String, font : UIFont, width : CGFloat) -> CGFloat{
        
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = font
        label.text = text
        
        label.sizeToFit()
        return label.frame.height
        
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}


