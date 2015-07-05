//
//  MSScheduleTableView.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-02.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation
import UIKit

public class MSScheduleTableView : UITableView {

    var tableWidth : CGFloat {
        return self.bounds.width
    }

    var tableHeight : CGFloat {
        return self.bounds.height
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        
        super.init(frame: frame, style: style)
        
        self.sectionIndexBackgroundColor = GlobalConstants.Color.gold
        self.sectionIndexColor = GlobalConstants.Color.gold
        
        setTableHeaderView()
        
    }
    
//    public override func rectForSection(section: Int) -> CGRect {
//        return CGRect(x: 0, y: 0, width: tableWidth, height: 50)
//    }
    
    func setTableHeaderView() -> Void {
        
        let scheduleHeaderLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableWidth, height: 75))
        
        scheduleHeaderLabel.text = "Mansbridge Summit Schedule"
        scheduleHeaderLabel.font = GlobalConstants.Font.garamond_24
        scheduleHeaderLabel.textColor = GlobalConstants.Color.white
        scheduleHeaderLabel.backgroundColor = GlobalConstants.Color.red
        scheduleHeaderLabel.textAlignment = .Center
        
        self.tableHeaderView = scheduleHeaderLabel
    }

    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder : aDecoder)
    }
    
}












