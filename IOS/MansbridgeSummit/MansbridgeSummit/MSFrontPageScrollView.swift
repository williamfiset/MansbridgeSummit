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
        //addBottomImages()
        
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
    
    private func addBottomImages() -> Void {
        
        let imageWidth = GC.SCREEN_WIDTH / 4
        let y = GC.SCREEN_HEIGHT - GC.TAB_BAR_HEIGHT
        var x = CGFloat(0)
        
        let speaker1Image = UIImage(named: "Speaker1")
        let speaker2Image = UIImage(named: "Speaker2")
        let speaker3Image = UIImage(named: "Speaker3")
        let speaker4Image = UIImage(named: "Speaker4")
        
        let speaker1Button = createSpeakerButton(speaker1Image!, x: x, y: y, width: imageWidth)
        x += imageWidth
        let speaker2Button = createSpeakerButton(speaker2Image!, x: x, y: y, width: imageWidth)
        x += imageWidth
        let speaker3Button = createSpeakerButton(speaker3Image!, x: x, y: y, width: imageWidth)
        x += imageWidth
        let speaker4Button = createSpeakerButton(speaker4Image!, x: x, y: y, width: imageWidth)
        
        // Tag each image with an id so that we can know which is which when clicked ~!~!~!
        speaker1Button.tag = 0
        speaker2Button.tag = 1
        speaker3Button.tag = 2
        speaker4Button.tag = 3
        
        speakerButtons.append(speaker1Button)
        speakerButtons.append(speaker2Button)
        speakerButtons.append(speaker3Button)
        speakerButtons.append(speaker4Button)
        
        addSubview(speaker1Button)
        addSubview(speaker2Button)
        addSubview(speaker3Button)
        addSubview(speaker4Button)

    }
    
    private func createSpeakerButton(image: UIImage, x: CGFloat, y: CGFloat, width: CGFloat) -> UIButton {
    
        let ratio = image.size.width / image.size.height
        let newHeight = CGFloat(width) / ratio
        let buttonFrame = CGRect(x: x, y: y - newHeight, width: width, height: newHeight)
        
        let speakerButton = UIButton(frame: buttonFrame)
        speakerButton.setImage(image, forState: UIControlState.Normal)
        
        return speakerButton
    
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
