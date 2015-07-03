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

public class MSScheduleTabController : UITableViewController{
    
    public override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    override init(style: UITableViewStyle) {
        super.init(style: .Plain) // .Grouped? Try this out
    }

    // Doesn't this defeat the purpose of MVC? Because now the controller only work with
    // one table unless you subless it and override this method?
    public override func loadView() {

        let newTable = MSScheduleTableView()

        newTable.dataSource = self
        newTable.delegate = self
        
        self.view = newTable
        self.tableView = newTable
        
    }

    
    /* Each Day Should be a 'section' in the table view. This number should be a constant. */
    public override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    /* Each Day (section) has multiple events (rows). Given a day return the number of events in the day */
    public override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (section == 1) {
            return 2
        }
        
        return 3;
    }

    
    /* Given the section (Day) and the Row (Event) from the NSIndexPath object create a UITableCell */
    public override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        // Extract the Section
        let day = indexPath.section
        
        // Extract the Row
        let event = indexPath.row
        
        print("day: \(day), event: \(event)")
        
        // Fetch required data in Data structure 
        
        
        // Create UITableViewCell with a resuable identifier.
        // The resueable idenfiier lets you save tons of memory by snagging a cell 
        // with the same identifier and copying it's properties.

        // New Day Header
        if (event == 0) {
            
            // Looks for an already created cell with the "Day" identifier
            var dayCell = tableView.dequeueReusableCellWithIdentifier("Day")
            
            if (dayCell === nil) {
                
                // Create a MSScheduleTabCell Instead?
                dayCell = UITableViewCell(style: .Default, reuseIdentifier: "Day")
                dayCell?.textLabel?.text = "Day Header"
                dayCell?.textLabel?.textColor = UIColor.redColor()
            }
            
            return dayCell!
            
        } else {
            
            var eventCell = tableView.dequeueReusableCellWithIdentifier("Event")

            if (eventCell === nil) {

                // Create a MSScheduleTabCell Instead?
                eventCell = UITableViewCell(style: .Default, reuseIdentifier: "Event")
                eventCell?.textLabel?.text = "Event Text"
            }
            return eventCell!
        }

    }
    
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
