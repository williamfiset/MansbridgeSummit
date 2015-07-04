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
    
    var eventTimeLabel = UILabel()
    var cellDelimiter = UIView()
    var eventDescriptionLabel = UILabel()
    
    let DELIMITER_X_POS = 125
    let DELIMITER_WIDTH = 10
    
    var cellHeight : Int {
        return Int(self.contentView.bounds.height)
    }
    
    init( eventTime : String, eventDescription : String, cellIdentifier : String ) {

        super.init(style: .Default, reuseIdentifier: cellIdentifier)
        
        setTimeLabelProperties(eventTime)
        setCellDelimiterProperties()
        setEventDescriptionLabelProperties(eventDescription)
        
        self.contentView.addSubview(eventTimeLabel)
        self.contentView.addSubview(cellDelimiter)
        self.contentView.addSubview(eventDescriptionLabel)
  
    }
    
    private func setTimeLabelProperties( eventTime : String ) {
        
        eventTimeLabel.text = eventTime;
        eventTimeLabel.frame = CGRect(x: 10, y: 10, width: 100, height: cellHeight)
        eventTimeLabel.adjustsFontSizeToFitWidth = true
        eventTimeLabel.font = GlobalConstants.Font.myraidpro_bold_18
        
    }

    private func setCellDelimiterProperties() {
        
        let rect = CGRect(x: DELIMITER_X_POS, y: 0, width: DELIMITER_WIDTH, height: cellHeight)
        
        cellDelimiter = UIView(frame: rect)
        cellDelimiter.backgroundColor = GlobalConstants.Color.red
        
    }
    
    private func setEventDescriptionLabelProperties( eventDescription : String ) {
        
        eventDescriptionLabel.text = eventDescription;
        eventDescriptionLabel.frame = CGRect(x: 150, y: 10, width: 300, height: cellHeight)
        eventDescriptionLabel.font = GlobalConstants.Font.garamond_14
        eventDescriptionLabel.adjustsFontSizeToFitWidth = true

    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

















