//
//  MSScheduleTabController.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-02.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation
import UIKit

// Delegate Here?

public class MSScheduleTableController : UITableViewController {
    
    // Name given to cells which can be reused when creating a view
    // (which is all event cells except the first)
    let eventCellID = "EventCell"
    
    let schedule_file_name = "test_schedule"
    var days : [MSDay] = []
    
    public override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // remove? or use when displaying data?
    }
    
    override init(style: UITableViewStyle) {

        super.init(style: style) // .Grouped? Try this out
    }
    
    
    // Doesn't this defeat the purpose of MVC? Because now the controller only work with
    // one table unless you subless it and override this method?
    public override func viewWillAppear(animated: Bool) {
        
        // Remove the navigation bar to provide more room for viewing
        self.navigationController!.navigationBar.hidden = true
        
        let newTable = MSScheduleTableView()
        
        newTable.dataSource = self
        newTable.delegate = self
        
        self.view = newTable
        self.tableView = newTable
        
        if let reader = MSScheduleReader(fileName: schedule_file_name) {
            days = reader.read()
        }
    }
    
    public override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    /* Each Day is a 'section' in the table view, ∴ return the number of days */
    public override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return days.count
    }
    
    /* Each Day (section) has multiple events (rows). Given a day return the number of events in the day */
    public override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section < days.count {
            return days[section].events.count
        } else {
            assert(false)
            return -1
        }

    }

    
    /* Given the section (Day) and the Row (Event) from the NSIndexPath object create a UITableCell */
    public override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        // Extract the Section
        let dayIndex = indexPath.section
        
        // Extract the Row
        let eventIndex = indexPath.row
        
        // Fetch required data in Data structure 
        
        if dayIndex < days.count {
            let day = days[dayIndex]
            if eventIndex < day.events.count {
                
                let event = day.events[eventIndex]
                
                // Create UITableViewCell with a resuable identifier.
                // The resueable idenfiier lets you save tons of memory by snagging a cell
                // with the same identifier and copying it's properties.
                
                var eventCell = tableView.dequeueReusableCellWithIdentifier(eventCellID)
                
                if (eventCell === nil) {
                    eventCell = MSScheduleCellView(event: event, cellIdentifier: eventCellID)
                }
                
                if (eventCell != nil) {
                    return eventCell!
                }
                
            }
        }
        
        // Ohh no, where did our cell go?
        assert(false)
        return UITableViewCell()


    }
    
    public override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section < days.count {
            return days[section].date
        } else {
            assert(false)
            return "Invalid Date"
        }
        
    }
    
    
    public override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section < days.count {
            
            let msdate = days[section]
            
            let dateLabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: tableView.bounds.width, height: 50))
            
            dateLabel.text = msdate.date
            dateLabel.font = GlobalConstants.Font.garamond_22
            dateLabel.textColor = GlobalConstants.Color.white
            dateLabel.backgroundColor = GlobalConstants.Color.gold
            dateLabel.adjustsFontSizeToFitWidth = true
            dateLabel.textAlignment = .Center
            
            return dateLabel
            
        }
        
        assert(false)
        
        return UIView()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}








