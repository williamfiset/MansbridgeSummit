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
    
    init(frame: CGRect, inout withSpeaker speaker : MSSpeaker? ) {
        
        super.init(frame: frame)
        
        self.backgroundColor = GC.Color.white
        self.showsVerticalScrollIndicator = true
        self.scrollEnabled = true;
        self.userInteractionEnabled = true;
        self.indicatorStyle = UIScrollViewIndicatorStyle.Black
        
        if speaker != nil {
            
            createSpeakerNameLabel(&speaker!)
            createSpeakerImage(&speaker!)
            createSpeakerBio(&speaker!)
            createSpeakerVideos(&speaker!)
            
        }
        
        // Compute minimum height and set content size
        self.contentSize = CGSize(width: frame.width, height: frame.height*3)

        
    }
    
    private func createSpeakerNameLabel( inout speaker : MSSpeaker ) -> Void {
        
        let nameFrame = CGRectMake(0, 0, GC.SCREEN_WIDTH, 75)
        
        nameLabel = UILabel(frame: nameFrame)
        nameLabel.text = speaker.name
        nameLabel.textAlignment = .Center
        nameLabel.font = GC.Font.garamond_30
        nameLabel.backgroundColor = UIColor.redColor()
        
        self.addSubview(nameLabel)
        
    }
    
    private func createSpeakerImage( inout speaker : MSSpeaker ) -> Void {
        
        let img = UIImage(named: speaker.image_name)
        
        let x = CGFloat(0)
        let y = nameLabel.frame.height
        
        // Recode to keep aspect ratio
        let w = GC.SCREEN_WIDTH
        let h = GC.SCREEN_HEIGHT - GC.TAB_BAR_HEIGHT*2 - y
        
        let imgFrame = CGRectMake(x, y, w, h)
        let paddedFrame = CGRectInset(imgFrame, PADDING, PADDING)
        
        let imageView = UIImageView(image: img)
        imageView.frame = paddedFrame
        
        self.speakerImage = imageView
        
        self.addSubview(imageView)
        
    }
    
    private func createSpeakerBio ( inout speaker : MSSpeaker ) -> Void {
        
            /* Profession Header */
        
        let x = CGFloat(0)
        let w = GC.SCREEN_WIDTH
        
        var y = speakerImage.frame.origin.y + speakerImage.frame.height + PADDING
        var h = CGFloat(35)

        let professionHeader = UILabel(frame: CGRectMake(x, y, w, h))
        professionHeader.text = "Profession:"
        professionHeader.textAlignment = .Center
        professionHeader.font = UIFont(name: "Arial", size: 24.0)
        professionHeader.backgroundColor = UIColor.purpleColor()

            /* Profession Label */

        y = professionHeader.frame.origin.y + h
        h = heightForView( speaker.profession, font: GC.Font.myraidpro_16!, width: w)
        
        let professionLabelFrame = CGRectMake(x, y, w, h)
        let professionLabelFrameInset = CGRectInset(professionLabelFrame, PADDING, 0)
        
        professionLabel = UILabel(frame: professionLabelFrameInset)
        professionLabel.text = speaker.profession
        professionLabel.textAlignment = .Center
        professionLabel.font = GC.Font.myraidpro_16
        professionLabel.backgroundColor = UIColor.greenColor()
        professionLabel.lineBreakMode = NSLineBreakMode.ByClipping
        professionLabel.numberOfLines = 0 // unlimited lines
      
            /* Bio Header */
        
        y = professionLabel.frame.origin.y + professionLabel.frame.height
        h = 35
        
        let bioHeader = UILabel(frame: CGRectMake(x, y, w, h))
        bioHeader.text = "BIO:"
        bioHeader.font = UIFont(name: "Arial", size: 24.0)
        bioHeader.backgroundColor = UIColor.grayColor()
        bioHeader.textAlignment = .Center
        
            /* Bio Description */
        
        y = bioHeader.frame.origin.y + h
        h = heightForView( speaker.short_description, font: GC.Font.myraidpro_16!, width: w)
        
        let descriptionLabelFrame = CGRectMake(x, y, w, h)
        let descriptionLabelFrameInset = CGRectInset(descriptionLabelFrame, PADDING, 0)
        
        descriptionLabel = UILabel(frame: descriptionLabelFrameInset)
        descriptionLabel.text = speaker.short_description
        descriptionLabel.textAlignment = .Center
        descriptionLabel.font = GC.Font.myraidpro_16
        descriptionLabel.backgroundColor = UIColor.greenColor()
        descriptionLabel.lineBreakMode = NSLineBreakMode.ByClipping
        descriptionLabel.numberOfLines = 0 // unlimited lines
        descriptionLabel.backgroundColor = UIColor.magentaColor()
        
        self.addSubview(professionHeader)
        self.addSubview(professionLabel)
        self.addSubview(bioHeader)
        self.addSubview(descriptionLabel)
        

    }
    
    private func createSpeakerVideos( inout speaker : MSSpeaker ) -> Void {
        
        let videoWidth = GC.SCREEN_WIDTH - (PADDING * 2)
        let videoHeight = videoWidth / 2
        
        let x = PADDING
        let y = descriptionLabel.frame.origin.y + descriptionLabel.frame.height
        
        for ( var i : CGFloat = 0; Int(i) < speaker.videos.count; i++) {
            
            let frame = CGRectMake( x, y + (i+1)*PADDING + i*videoHeight , videoWidth, videoHeight)
            let videoPlayer = YouTubePlayerView(frame: frame)
            videoPlayer.loadVideoID( speaker.videos[Int(i)] )
            self.addSubview(videoPlayer)
            
        }
        
    }
    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        
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


