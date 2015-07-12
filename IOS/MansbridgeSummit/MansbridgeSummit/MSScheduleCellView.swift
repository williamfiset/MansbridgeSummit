//
//  MSScheduleTabViewCell.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-02.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

// This class defines what properties a cell should have

import Foundation
import UIKit

public class MSScheduleCellView : UITableViewCell {
    
    let event : MSEvent!
    
    var eventTimeLabel = UILabel()
    var cellDelimiter = UIView()
    var eventNameLabel = UILabel()

    var cellHeight : CGFloat {
        return self.contentView.bounds.height
    }
    
    var cellWidth : CGFloat {
        return self.contentView.bounds.width
    }
    
    var DELIMITER_WIDTH : CGFloat {
        if GlobalConstants.DeviceType.iPhone {
           return 5
        } else {
            return 10
        }
    }
    
    var DELIMITER_SPACING : CGFloat {
        if GlobalConstants.DeviceType.iPhone {
            return 3
        } else {
            return 10
        }
    }
    
    let TIME_LABEL_LEFT_SPACING : CGFloat = 10.0
    
    static var MAX_TIME_LABEL_LEN : CGFloat {
        
        var length : CGFloat = 0.0
        
        let tempLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        tempLabel.font = GlobalConstants.Font.myraidpro_bold_18
        
        tempLabel.text = ":"
        length += tempLabel.intrinsicContentSize().width
        
        var maxNumSize : CGFloat = 0.0
        for n in 0...9 {
            tempLabel.text = "\(n)"
            if tempLabel.intrinsicContentSize().width * 4 > maxNumSize {
                maxNumSize = tempLabel.intrinsicContentSize().width * 4
            }
        }
        length += maxNumSize
        
        tempLabel.text = "am";
        let amLen = tempLabel.intrinsicContentSize().width
        tempLabel.text = "pm"
        let pmLen = tempLabel.intrinsicContentSize().width
        
        length += amLen > pmLen ? amLen : pmLen
        
        return length
        
    }
    
    
    init( event : MSEvent, cellIdentifier : String ) {

        self.event = event
        
        super.init(style: .Default, reuseIdentifier: cellIdentifier)

        setTimeLabelProperties(event.eventTime)
        setCellDelimiterProperties()
        setEventNameLabelProperties(event.eventName)
        
        self.contentView.addSubview(eventTimeLabel)
        self.contentView.addSubview(cellDelimiter)
        self.contentView.addSubview(eventNameLabel)
  
    }
    
    private func setTimeLabelProperties( eventTime : String ) {
        
        eventTimeLabel.text = eventTime;
        eventTimeLabel.frame = CGRect(x: TIME_LABEL_LEFT_SPACING, y: 10.0, width: MSScheduleCellView.MAX_TIME_LABEL_LEN, height: cellHeight)
        eventTimeLabel.adjustsFontSizeToFitWidth = true
        eventTimeLabel.font = GlobalConstants.Font.myraidpro_bold_18
        
    }

    private func setCellDelimiterProperties() {
        
        let xPos = MSScheduleCellView.MAX_TIME_LABEL_LEN + DELIMITER_SPACING + TIME_LABEL_LEFT_SPACING
        let rect = CGRect(x: xPos, y: 0, width: DELIMITER_WIDTH, height: cellHeight)
        
        cellDelimiter = UIView(frame: rect)
        cellDelimiter.backgroundColor = GlobalConstants.Color.red
        
    }
    
    private func setEventNameLabelProperties( eventDescription : String ) {
        
        let xPos = MSScheduleCellView.MAX_TIME_LABEL_LEN + DELIMITER_SPACING*2 + DELIMITER_WIDTH + TIME_LABEL_LEFT_SPACING
        
        eventNameLabel.frame = CGRect(
            x: xPos,
            y: 10,
            width: cellWidth - xPos,
            height: cellHeight
        )
        
        eventNameLabel.text = eventDescription;
        eventNameLabel.font = GlobalConstants.Font.garamond_18
        eventNameLabel.adjustsFontSizeToFitWidth = true

    }

    // Not planning on using this init method
    required public init!(coder aDecoder: NSCoder) {
        
        event = nil
        super.init(coder: aDecoder)
        
    }
    
}

















