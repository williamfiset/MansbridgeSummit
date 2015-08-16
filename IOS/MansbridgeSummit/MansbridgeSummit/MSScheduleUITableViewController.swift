//
//  MSScheduleUITableViewController
//  SelfSizingDemo
//
//  Created by Simon Ng on 4/9/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

import UIKit

class MSScheduleUITableViewController: UITableViewController {
    
    var schedule_file_name = "test_schedule2"
    var days : [MSDay] = []
    
    override func viewDidLoad() {
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
        
        let scheduleHeaderLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: 75))
        
        scheduleHeaderLabel.text = "Mansbridge Summit Schedule"
        scheduleHeaderLabel.font = GC.Font.myraidpro_bold_26
        scheduleHeaderLabel.adjustsFontSizeToFitWidth = true
        scheduleHeaderLabel.textColor = GC.Color.white
        scheduleHeaderLabel.backgroundColor = GC.Color.red
        scheduleHeaderLabel.textAlignment = .Center

        self.tableView.tableHeaderView = scheduleHeaderLabel

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /* Each Day is a 'section' in the table view, ∴ return the number of days */
    internal override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return days.count
    }
    
    /* Each Day (section) has multiple events (rows). Given a day return the number of events in the day */
    internal override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days[section].events.count
    }
    
    /* Return the header for each section (the date) */
    internal override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return days[section].date
    }
    
    /* Create a view (UILabel in this case) which will appear at the top of the UITableView (header) */
    internal override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
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

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "EventCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MSScheduleUITableViewCell
        
        // Extract the Section
        let dayIndex = indexPath.section
        
        // Extract the Row
        let eventIndex = indexPath.row
        
        // Fetch required data in Data structure
        let day = days[dayIndex]
        let event = day.events[eventIndex]
        
        cell.timeLabel.text = event.eventTime
        cell.nameLabel.text = event.eventName
        cell.descriptionLabel.text = event.eventLocation
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! MSScheduleUITableViewCell
        
        // Extract the Section
        let dayIndex = indexPath.section
        
        // Extract the Row
        let eventIndex = indexPath.row
        
        // Fetch required data in Data structure
        let day = days[dayIndex]
        let event = day.events[eventIndex]
        
        if (cell.descriptionLabel.text == event.eventLocation) {
            cell.descriptionLabel.text = event.eventLocation + "\n" + event.eventDescription
        } else {
            cell.descriptionLabel.text = event.eventLocation
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
}

