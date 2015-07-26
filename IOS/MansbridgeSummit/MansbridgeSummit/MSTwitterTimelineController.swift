//
//  MSTwitterTimelineController.swift
//  MansbridgeSummit
//
//  Created by Micah Stairs on 2015-07-18.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import UIKit
import CloudKit
import TwitterKit

class MSTwitterTimelineController: TWTRTimelineViewController, NetworkFailureRecovery, UINavigationBarDelegate /*, TWTRTweetViewDelegate */{
    
    weak var networkErrorView : UIView?
    
    var twitterNavigationItem : UINavigationItem!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
                
        let insets = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
        self.tableView.contentInset = insets
        self.tableView.scrollIndicatorInsets = insets
        
        // Create the navigation bar
        let navigationBar = UINavigationBar(frame: CGRectMake(0, -44, self.view.frame.size.width, 44))
        navigationBar.backgroundColor = UIColor.whiteColor()
        navigationBar.delegate = self;
        
        // Create a navigation items
        self.twitterNavigationItem = UINavigationItem()
        self.twitterNavigationItem.title = "Twitter Feed"
        self.twitterNavigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: UIBarButtonItemStyle.Plain, target: self, action: "postTweet")
        
        // Assign the navigation item to the navigation bar
        navigationBar.items = [twitterNavigationItem]
        
        // Make the navigation bar a subview of the current view controller
        self.view.addSubview(navigationBar)
        
        // Load the Twitter feed if there is an Internet connection
        let connection = Reachability(hostName: "www.twitter.com")
        if connection.isReachable() {
            loadTweets()
        } else {
            displayNetworkConnectionErrorView()
        }
        
    }
    
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return UIBarPosition.TopAttached
    }
    
    func loadTweets() -> Void {
        
        Twitter.sharedInstance().logInGuestWithCompletion { session, error in
            if let _ = session {
                self.dataSource = TWTRCollectionTimelineDataSource(collectionID: "625072681285758976", APIClient: Twitter.sharedInstance().APIClient)
            } else {
                print("error: \(error.localizedDescription)")
            }
        }
        
    }
    
    func postTweet() -> Void {
        
        getDefaultStatusAndExecFunc(postTweetHelper)
        
    }
    
    func postTweetHelper(defaultStatus : String) -> Void {
        
        let composer = TWTRComposer()
        
        composer.setText(defaultStatus)
        
        composer.showFromViewController(self) { result in
//            if (result == TWTRComposerResult.Cancelled) {
//                
//            } else {
//                let alertController = UIAlertController(title: "Success", message:
//                    "Your tweet has been sent!", preferredStyle: UIAlertControllerStyle.Alert)
//                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
//                self.presentViewController(alertController, animated: true, completion: nil)
//            }
        }
        
    }
    
    func getDefaultStatusAndExecFunc(closure : (query : String) -> Void) -> Void {
        
        let queryPredicate = NSPredicate(value: true)
        
        let publicDB = CKContainer.defaultContainer().publicCloudDatabase
        let query = CKQuery(recordType: "MansbridgeData", predicate: queryPredicate)
        
        publicDB.performQuery(query, inZoneWithID: nil, completionHandler: {
            records, err in
            
            if err == nil && records != nil {
                
                let record = (records as [CKRecord]!)[0]
                let defaultStatus = record["Value"]!
                
                dispatch_async(dispatch_get_main_queue()) {
                    closure(query: defaultStatus as! String)
                }
                
            } else {
                print(err!.description)
                closure(query: "#MansbridgeSummit")
            }
            
        })
    }
    
    
    func displayNetworkConnectionErrorView() -> Void {
        
        // Remove webview
        if self.tableView != nil {
            self.tableView.removeFromSuperview()
        }
        
        // Load XIB File only if the error page does not exist
        if networkErrorView == nil {
            if let _networkErrorView = UIView.loadFromNibNamed("NetworkErrorXIB") {
                self.tableView.separatorStyle = .None;
                networkErrorView = _networkErrorView
                _networkErrorView.frame = self.view.frame
                self.view.addSubview(_networkErrorView)
            }
        }
        
    }
    
    func removeNetworkConnectionErrorView() -> Void {
        if networkErrorView != nil {
            networkErrorView!.removeFromSuperview()
        }
    }
    
}