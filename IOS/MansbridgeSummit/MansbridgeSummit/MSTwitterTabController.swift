//
//  MSTwitterTabController.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-02.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation
import UIKit

import TwitterKit

public class MSTwitterTabController : UITableViewController, TWTRTweetViewDelegate, NetworkFailureRecovery {
    
    weak var networkErrorView : UIView?
    
    let tweetTableReuseIdentifier = "TweetCell"
    // Hold all the loaded Tweets
    var tweets: [TWTRTweet] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    let tweetIDs = ["20", // @jack's first Tweet
        "510908133917487104"] // our favorite bike Tweet
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

//    @IBOutlet weak var tableView: UITableView!
    
    
//    var twitterFeed = []
    
    public override func viewDidLoad() {

//        super.viewDidLoad()
        
            // Setup the table view
            tableView.estimatedRowHeight = 150
            tableView.rowHeight = UITableViewAutomaticDimension // Explicitly set on iOS 8 if using automatic row height calculation
            tableView.allowsSelection = false
            tableView.registerClass(TWTRTweetTableViewCell.self, forCellReuseIdentifier: tweetTableReuseIdentifier)
            
            Twitter.sharedInstance().logInGuestWithCompletion { guestSession, error in
                if (guestSession != nil) {
                    // make API calls that do not require user auth
                } else {
                    print("error: \(error.localizedDescription)");
                }
            }
            // Load Tweets
            Twitter.sharedInstance().APIClient.loadTweetsWithIDs(tweetIDs) { tweets, error in
                if let ts = tweets as? [TWTRTweet] {
                    self.tweets = ts
                } else {
                    print("Failed to load tweets: \(error!.localizedDescription)")
                }
            }

        
       
//        var twitter: STTwitterAPI = STTwitterAPI(OAuthConsumerKey: "1QaB3nlI2dXah3vJiIIbtDBaP", consumerSecret: "V2qExJfJtPR81Gtn1cl6DjFuzWJ3HcGqJLPpIXd5kwp6zt4Ctz", oauthToken: "109002432-FT1GsSfJDpVtkYPgzPoK7fuPfwrpdXnfPeaVKp6s", oauthTokenSecret: "sgLBqasL56lJQXKhlxAuBBAqFSfjfH06ap1O9iVBmrEb3")
//        
//        func success(str : String!) {
//            
//            twitter.getUserTimelineWithScreenName("mtasummit", successBlock: {
//                (statuses: [AnyObject]!) in
//                
//                    self.twitterFeed = statuses as NSArray
//                    self.tableView.reloadData()
//                
//                }, errorBlock: {
//                (err : NSError!) in
//                    
//                    if err != nil {
//                        print(err.description)
//                    }
//            })
//            
//        }
//        
//        twitter.verifyCredentialsWithSuccessBlock(success, errorBlock: nil)
        
    }

    func displayNetworkConnectionErrorView() -> Void {
        
        // Remove webview
        if self.tableView != nil {
            self.tableView.removeFromSuperview()
        }
        
        // Load XIB File only if the error page does not exist
        if networkErrorView == nil {
            if let _networkErrorView = UIView.loadFromNibNamed("NetworkErrorXIB") {
                networkErrorView = _networkErrorView
                self.view.addSubview(_networkErrorView)
            }
        }
        
    }
   
    func removeNetworkConnectionErrorView() -> Void {
        if networkErrorView != nil {
            networkErrorView!.removeFromSuperview()
        }
    }
   
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.twitterFeed.count
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cellID: String = "TwitterCell"
//        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellID)!
//        if cell == nil {
//            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
//        }
//        let index: Int = indexPath.row
//        var t: [NSObject: AnyObject] = self.twitterFeed[index] as! [NSObject : AnyObject]
//        cell!.textLabel!.text = t["text"] as? String
//        return cell!
//    }
//    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//    }
//    
    
    // MARK: UITableViewDelegate Methods
    override public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tweets.count
    }
    
    override public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tweet = tweets[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(tweetTableReuseIdentifier, forIndexPath: indexPath) as! TWTRTweetTableViewCell
        cell.tweetView.delegate = self
        cell.configureWithTweet(tweet)
        return cell
    }
    
    override public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let tweet = tweets[indexPath.row]
        return TWTRTweetTableViewCell.heightForTweet(tweet, width: CGRectGetWidth(self.view.bounds))
    }
    
}
