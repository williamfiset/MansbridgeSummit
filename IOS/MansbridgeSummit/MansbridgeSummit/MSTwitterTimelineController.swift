//
//  MSTwitterTimelineController.swift
//  MansbridgeSummit
//
//  Created by Micah Stairs on 2015-07-18.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import UIKit
import TwitterKit

class MSTwitterTimelineController: TWTRTimelineViewController/*, TWTRTweetViewDelegate */{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
//            if (session != nil) {
//                print("signed in as \(session.userName)");
//            } else {
//                print("error: \(error.localizedDescription)");
//            }
//        })
//        logInButton.center = self.view.center
//        self.view.addSubview(logInButton)
//        
//        Twitter.sharedInstance().logInWithCompletion { session, error in
//            if (session != nil) {
//                logInButton.removeFromSuperview()
//                print("signed in as \(session.userName)");
//                let client = Twitter.sharedInstance().APIClient
//                self.dataSource = TWTRUserTimelineDataSource(screenName: "mtasummit", APIClient: client)
//            } else {
//                logInButton.removeFromSuperview()
//                print("error: \(error.localizedDescription)");
//            }
//        }
//        
        Twitter.sharedInstance().logInGuestWithCompletion { session, error in
            if let validSession = session {
                let client = Twitter.sharedInstance().APIClient
                self.dataSource = TWTRUserTimelineDataSource(screenName: "mtasummit", APIClient: client)
            } else {
                print("error: \(error.localizedDescription)")
            }
        }
    }

//    func tweetView(tweetView: TWTRTweetView, didSelectTweet tweet: TWTRTweet) {
//        let kTweetOriginX: CGFloat = 0.0
//        let kTweetOriginY: CGFloat = 0.0
//        let kTweetWidth: CGFloat = 300.0
//        let kTweetHeightAdjustment: CGFloat = 100.0
//        
////        print(self.navigationController)
////        print(self.navigationController!)
//        let kTweetHeight: CGFloat = self.view.frame.size.height /* - self.navigationController!.navigationBar.frame.size.height */ - kTweetHeightAdjustment
//        let tweetViewController: UIViewController = UIViewController()
//        let customView: TWTRTweetView = TWTRTweetView(tweet: tweet, style: .Regular)
//        customView.showBorder = false
//        if customView.frame.size.height > self.view.frame.size.height {
//            customView.frame = CGRectMake(kTweetOriginX, kTweetOriginY, kTweetWidth, kTweetHeight)
//        }
////        var backgroundImage: UIImageView = UIImageView(image: UIImage(named: "Background.png"))
////        tweetViewController.view = backgroundImage
//        tweetViewController.view.contentMode = .ScaleAspectFit
//        tweetViewController.view.userInteractionEnabled = true
//        tweetViewController.view.addSubview(customView)
//        customView.center = self.view.center
////        print(self.navigationController)
////        print(self.navigationController!)
//        
//        self.presentViewController(tweetViewController, animated: true, completion: nil)
//        
////        self.navigationController!.pushViewController(tweetViewController, animated: true)
//    }
}