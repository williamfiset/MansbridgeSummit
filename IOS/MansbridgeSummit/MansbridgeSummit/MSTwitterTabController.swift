//
//  MSTwitterTabController.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-02.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation
import UIKit

public class MSTwitterTabController : UIViewController {
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var tableView : UITableView? = nil
    var twitterFeed  = [] // : NSMutableArray
    
    public override func viewDidLoad() {
        
        super.viewDidLoad()
       
        var twitter: STTwitterAPI = STTwitterAPI(OAuthConsumerKey: "xz9ew8UZ6rz8TW3QBSDYg", consumerSecret: "rm8grg0aIPCUnTpgC5H1NMt4uWYUVXKPqH8brIqD4o")
        
        func success( str : String!) {
            
            twitter.getUserTimelineWithScreenName("veasoftware", successBlock: {
                (statuses: [AnyObject]!) in
                self.twitterFeed = statuses as NSArray
                self.tableView!.reloadData()
            }, errorBlock: nil)

        }
        
        twitter.verifyCredentialsWithSuccessBlock(success, errorBlock: nil)
        
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.twitterFeed.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellID: String = "TwitterCell"
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellID)!
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
        }
        let idx: Int = indexPath.row
        var t: [NSObject: AnyObject] = self.twitterFeed[idx] as! [NSObject : AnyObject]
        cell!.textLabel!.text = t["text"] as? String
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
}
