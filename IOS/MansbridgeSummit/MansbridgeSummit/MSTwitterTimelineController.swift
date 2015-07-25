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

class MSTwitterTimelineController: TWTRTimelineViewController, NetworkFailureRecovery /*, TWTRTweetViewDelegate */{
    
    weak var networkErrorView : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                print("signed in as \(session.userName)");
            } else {
                print("error: \(error.localizedDescription)");
            }
        })
        self.view.addSubview(logInButton)
        
        let connection = Reachability(hostName: "www.twitter.com")
        
        if connection.isReachable() {
            
            loadTwitterFeedAsGuest()
            
        } else {
            displayNetworkConnectionErrorView()
        }
        
    }
    
    func loadTwitterFeedAsGuest() -> Void {
        
        getQueryStringAndExecFunc(loadTweetsAsGuest)
        
    }
    
    func loadTweetsAsGuest(queryString : String) {
        
        Twitter.sharedInstance().logInGuestWithCompletion { session, error in
            if let _ = session {
                self.dataSource = TWTRSearchTimelineDataSource(searchQuery: queryString, APIClient: Twitter.sharedInstance().APIClient)
            } else {
                print("error: \(error.localizedDescription)")
            }
        }
        
        print(self.tableView.numberOfRowsInSection(0))
        
    }
    
    
    func loadTwitterFeedAsUser() -> Void {
        
        getQueryStringAndExecFunc(loadTweetsAsUser)
        
    }
    
    func loadTweetsAsUser(queryString : String) {
        
        Twitter.sharedInstance().logInWithCompletion { session, error in
            if (session != nil) {
                print("signed in as \(session.userName)");
                self.dataSource = TWTRSearchTimelineDataSource(searchQuery: queryString, APIClient: Twitter.sharedInstance().APIClient)
            } else {
                print("error: \(error.localizedDescription)");
            }
        }
        
    }
    
    func getQueryStringAndExecFunc (closure : (query : String) -> Void) -> Void {
        
        let queryPredicate = NSPredicate(value: true)
        
        let publicDB = CKContainer.defaultContainer().publicCloudDatabase
        let query = CKQuery(recordType: "TwitterRecord", predicate: queryPredicate)
        
        publicDB.performQuery(query, inZoneWithID: nil, completionHandler: {
            records, err in
            
            if err == nil && records != nil {
                
                let record = (records as [CKRecord]!)[0]
                let twitterQuery = record["twitterQueryString"]!
                
                dispatch_async(dispatch_get_main_queue()) {
                    closure(query: twitterQuery as! String)
                }
                
            } else {
                print(err!.description)
                // closure(query: "#MansbridgeSummit OR from:mtasummit")
                closure(query: "#MansbridgeSummit OR from:mtasummit OR cats") // TEMPORARY!!!
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