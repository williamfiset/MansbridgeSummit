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
    
    let MS_TOTAL_DAYS = 3
    
    public override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // remove? or use when displaying data?
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
        return MS_TOTAL_DAYS
    }
    
    /* Each Day (section) has multiple events (rows). Given a day return the number of events in the day */
    public override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
            case 0: return 1
            case 1: return 3
            case 2: return 2
            default: return 0
        }

    }

    
    /* Given the section (Day) and the Row (Event) from the NSIndexPath object create a UITableCell */
    public override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        // Extract the Section
        // let day = indexPath.section
        
        // Extract the Row
        // let event = indexPath.row
        
        // Fetch required data in Data structure 
        
        
        // Create UITableViewCell with a resuable identifier.
        // The resueable idenfiier lets you save tons of memory by snagging a cell 
        // with the same identifier and copying it's properties.
        
        var eventCell = tableView.dequeueReusableCellWithIdentifier("Event")

        if (eventCell === nil) {

            // Create a MSScheduleTabCell Instead?
            eventCell = MSScheduleCellView(eventTime: "Sat Oct 7", eventDescription: "A Merry Christmas", cellIdentifier: "Event Cell")
        }
        return eventCell!


    }
    
    public override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
            case 0: return "Sat Oct 4"
            case 1: return "Sun Oct 5"
            case 2: return "Mon Oct 6"
            default: return "Invalid Date"
        }
        
    }
    
    //public override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    //    return "Section Footer"
    //}
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}








