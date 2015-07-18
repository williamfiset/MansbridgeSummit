//
//  MSEventPageView.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-07.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation
import UIKit

public class MSEventPageView : UIView {
    
    let event : MSEvent

    var eventTimeLabel = UILabel()
    var eventNameLabel = UILabel()
    var eventLocationLabel = UILabel()
    var eventDescriptionLabel = UILabel()
    var eventSpeakerLabel = UILabel()

    var returnButton = UIButton();
    
    init(frame  : CGRect, event : MSEvent ) {
        
        self.event = event;

        super.init(frame: frame)
        
        self.backgroundColor = UIColor.grayColor()

        createReturnButton();
        setupLabels()
        addViews();

    }

    private func setupLabels () -> Void {
        
        var labels = [eventTimeLabel, eventNameLabel, eventLocationLabel, eventDescriptionLabel, eventSpeakerLabel]
        var labelSize = CGRect(x: 0, y: 75, width: self.bounds.width, height: 75)

        for(var i = 0; i < labels.count; i++) {
            labels[i].frame = labelSize
            labels[i].font = GC.Font.garamond_24;
            labels[i].textColor = GC.Color.white
            labelSize.origin.y += 75.0
        }
        
        eventTimeLabel.text = event.eventTime;
        eventNameLabel.text = event.eventName
        eventLocationLabel.text = event.eventLocation
        eventDescriptionLabel.text = event.eventDescription
        eventSpeakerLabel.text = event.eventSpeaker;
        
    }

    private func createReturnButton() -> Void {
        
        returnButton = UIButton(frame: CGRect(x: bounds.width/2, y: frame.height-100, width: 250, height: 75))
        returnButton.setTitle("Return", forState: UIControlState.Normal)
        
    }
    
    private func addViews() -> Void {
        
        self.addSubview(eventTimeLabel)
        self.addSubview(eventNameLabel)
        self.addSubview(eventLocationLabel)
        self.addSubview(eventDescriptionLabel)
        self.addSubview(eventSpeakerLabel)
        
        self.addSubview(returnButton)
    }
    
    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}