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
    
    var schedule_file_name = "test_schedule2"
    var days : [MSDay] = []
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        
//        tableView.estimatedRowHeight = 44.0
//        tableView.rowHeight = UITableViewAutomaticDimension
//        
//    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        if let reader = DataLoader(fileName: schedule_file_name, fileType: "json") {
            if let jsonData = reader.getJSONContent() {
                days = readSchedule( jsonData )
            } else {
                fatalError()
            }
        } else {
            fatalError()
        }
        
    }

    
    // viewWillAppear is called when the schedule tab button is pressed
    // but not when comming back from an MSEventPage. This means this method
    // acts as a constructor, in a sense.
    // NOTE: Shouldn't this code be in the view loading method? I don't see why we need to re-load the entire table each time..
//    public override func viewWillAppear(animated: Bool) {
//        
//        super.viewWillAppear(animated)
//        
//        let newTable = MSScheduleTableView()
//        
//        newTable.dataSource = self
//        newTable.delegate = self
//        
//        self.view = newTable
//        self.tableView = newTable
//        
//    }
    
    // Keep constructor (used in Test cases...)
//    override init(style: UITableViewStyle) {
//        super.init(style: style)
//    }
//
    public override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    public override func viewWillDisappear(animated: Bool) {
    
        // Unselect selected row when leaving this controller
        if let indexPath = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRowAtIndexPath(indexPath, animated: true);
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
        return days[section].events.count
    }
    
    /* Return the header for each section (the date) */
    public override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return days[section].date
    }

    
    /* Given the section (Day) and the Row (Event) from the NSIndexPath object create a UITableCell */
    public override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        // Extract the Section
        let dayIndex = indexPath.section
        
        // Extract the Row
        let eventIndex = indexPath.row
        
        // Fetch required data in Data structure 
        let day = days[dayIndex]
        let event = day.events[eventIndex]
        
        // Create UITableViewCell with a resuable identifier.
        // The resueable idenfiier lets you save tons of memory by snagging a cell
        // with the same identifier and copying its properties.
        
        if let eventCell = tableView.dequeueReusableCellWithIdentifier(eventCellID) {
            print("here")
            let _eventCell = eventCell as! MSScheduleCellView
            _eventCell.timeLabel.text = event.eventTime
            _eventCell.nameLabel.text = event.eventName
            _eventCell.descriptionLabel.text = event.eventLocation
            return eventCell
        } else {
            print("huh..")
            return MSScheduleCellView(event: event, cellIdentifier: eventCellID)
        }
        
    }
    
    /* Create a view (UILabel in this case) which will appear at the top of the UITableView (header) */
    public override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let msdate = days[section]
        
        let dateLabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: tableView.bounds.width, height: 50))
        
        dateLabel.text = msdate.date
        dateLabel.font = GC.Font.garamond_22
        dateLabel.textColor = GC.Color.white
        dateLabel.backgroundColor = GC.Color.gold
        dateLabel.adjustsFontSizeToFitWidth = true
        dateLabel.textAlignment = .Center
        
        return dateLabel
        
    }
    
    /* Executes when user presses a cell */
//    public override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//
//        let section = indexPath.section;
//        let row = indexPath.row;
//        let event = days[section].events[row];
//
//        // Find a neater way to set the view in the init method of MSEventPageController?
//        let controller = MSEventPageController()
//        controller.view = MSEventPageView( frame: controller.view.frame, event: event )
//        
//        self.navigationController?.pushViewController(controller, animated: true);
//
//    }
//    
//    required public init!(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
}








