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

    @IBOutlet weak var tableView: UITableView!
    
    var twitterFeed = []
    
    public override func viewDidLoad() {
        
        super.viewDidLoad()
       
        var twitter: STTwitterAPI = STTwitterAPI(OAuthConsumerKey: "1QaB3nlI2dXah3vJiIIbtDBaP", consumerSecret: "V2qExJfJtPR81Gtn1cl6DjFuzWJ3HcGqJLPpIXd5kwp6zt4Ctz", oauthToken: "109002432-FT1GsSfJDpVtkYPgzPoK7fuPfwrpdXnfPeaVKp6s", oauthTokenSecret: "sgLBqasL56lJQXKhlxAuBBAqFSfjfH06ap1O9iVBmrEb3")
        
        func success(str : String!) {
            
            twitter.getUserTimelineWithScreenName("mtasummit", successBlock: {
                (statuses: [AnyObject]!) in
                
                    self.twitterFeed = statuses as NSArray
                    self.tableView.reloadData()
                
                }, errorBlock: {
                (err : NSError!) in
                    
                    if err != nil {
                        print(err.description)
                    }
            })
            
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
        let index: Int = indexPath.row
        var t: [NSObject: AnyObject] = self.twitterFeed[index] as! [NSObject : AnyObject]
        cell!.textLabel!.text = t["text"] as? String
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
}
