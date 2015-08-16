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
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
//    var eventNameLabel = UILabel()
//    var eventTimeLabel = UILabel()
//    var cellDelimiter = UIView()

//    var cellHeight : CGFloat {
//        return self.contentView.bounds.height
//    }
//    
//    var cellWidth : CGFloat {
//        return self.contentView.bounds.width
//    }
//    
//    var DELIMITER_WIDTH : CGFloat {
//        if GC.DeviceType.iPhone {
//           return 5
//        } else {
//            return 10
//        }
//    }
//    
//    var DELIMITER_SPACING : CGFloat {
//        if GC.DeviceType.iPhone {
//            return 3
//        } else {
//            return 10
//        }
//    }
//    
//    var FONT_SIZE : UIFont {
//        if GC.DeviceType.iPhone {
//            return GC.Font.myraidpro_bold_18!
//        } else {
//            return GC.Font.myraidpro_bold_24!
//        }
//    }
    
//    let TIME_LABEL_LEFT_SPACING : CGFloat = 10.0
//    
//    static var MAX_TIME_LABEL_LEN : CGFloat {
//        
//        var length : CGFloat = 0.0
//        
//        // Setup
//        let tempLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        if GC.DeviceType.iPhone {
//            tempLabel.font = GC.Font.myraidpro_bold_18
//        } else {
//            tempLabel.font = GC.Font.myraidpro_bold_24
//        }
//        
//        // Calculate the space needed for the colon
//        tempLabel.text = ":"
//        length += tempLabel.intrinsicContentSize().width
//        
//        // Calculate the space needed for the 4 digits
//        var maxNumSize : CGFloat = 0.0
//        for n in 0...9 {
//            tempLabel.text = "\(n)"
//            if tempLabel.intrinsicContentSize().width > maxNumSize {
//                maxNumSize = tempLabel.intrinsicContentSize().width
//            }
//        }
//        length += maxNumSize * (CGFloat(4))
//        
//        // Calculate the maximum amount of space needed for "am" or "pm"
//        var maxTextSize : CGFloat = 0.0
//        tempLabel.text = "am"
//        if tempLabel.intrinsicContentSize().width > maxTextSize {
//            maxTextSize = tempLabel.intrinsicContentSize().width
//        }
//        tempLabel.text = "pm"
//        if tempLabel.intrinsicContentSize().width > maxTextSize {
//            maxTextSize = tempLabel.intrinsicContentSize().width
//        }
//        length += maxTextSize
//
//        
//        return length
//        
//    }
    
    
    init( event : MSEvent, cellIdentifier : String ) {
        
        self.event = event
        
        super.init(style: .Default, reuseIdentifier: cellIdentifier)

//        setTimeLabelProperties(event.eventTime)
//        setCellDelimiterProperties()
//        setEventNameLabelProperties(event.eventName)
        
//        self.contentView.addSubview(eventTimeLabel)
//        self.contentView.addSubview(cellDelimiter)
//        self.contentView.addSubview(eventNameLabel)
  
    }
    
//    private func setTimeLabelProperties( eventTime : String ) {
//        eventTimeLabel.text = eventTime;
//        eventTimeLabel.frame = CGRect(x: 0, y: 0, width: MSScheduleCellView.MAX_TIME_LABEL_LEN , height: cellHeight)
//        //eventTimeLabel.adjustsFontSizeToFitWidth = true
//        eventTimeLabel.font = FONT_SIZE
//        //eventTimeLabel.backgroundColor = UIColor.blueColor()
//        eventTimeLabel.textAlignment = .Center
//    }

//    private func setCellDelimiterProperties() {
//        
//        let xPos = MSScheduleCellView.MAX_TIME_LABEL_LEN + DELIMITER_SPACING + TIME_LABEL_LEFT_SPACING
//        let rect = CGRect(x: xPos, y: 0, width: DELIMITER_WIDTH, height: cellHeight)
//        
//        cellDelimiter = UIView(frame: rect)
//        cellDelimiter.backgroundColor = GC.Color.red
//        
//    }
    
//    private func setEventNameLabelProperties( eventDescription : String ) {
//        
//        let xPos = MSScheduleCellView.MAX_TIME_LABEL_LEN + DELIMITER_SPACING*2 + DELIMITER_WIDTH + TIME_LABEL_LEFT_SPACING
//        
//        eventNameLabel.frame = CGRect(
//            x: xPos,
//            y: 0,
//            width: GC.SCREEN_WIDTH - xPos,
//            height: cellHeight
//        )
//        
//        eventNameLabel.text = eventDescription;
//        eventNameLabel.font = FONT_SIZE
//        eventNameLabel.adjustsFontSizeToFitWidth = true
//        //eventNameLabel.backgroundColor = UIColor.greenColor()
//        eventNameLabel.textAlignment = .Center
//    }

    // Not planning on using this init method
    required public init!(coder aDecoder: NSCoder) {
        
        event = nil
        super.init(coder: aDecoder)
        
    }
    
}

















