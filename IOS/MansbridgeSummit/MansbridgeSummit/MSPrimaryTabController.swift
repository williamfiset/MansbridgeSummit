
//
//  MSPrimaryTabController.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-02.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation
import UIKit


public class MSPrimaryTabController : UIViewController, UIScrollViewDelegate {
    
    var scrollView : MSScrollView!

    // TEMPORARY
    public override func viewDidLoad() {
        super.viewDidLoad()
//        Twitter.sharedInstance().logInGuestWithCompletion { (session, error) in
//            Twitter.sharedInstance().APIClient.loadTweetWithID("223214234") { (tweet, error) in
//                self.view.addSubview(TWTRTweetView(tweet: tweet))
//            }
//        }

    }
    
    public override func viewWillAppear(animated: Bool) {
        
        self.navigationController!.navigationBar.hidden = true

    }
    
    public override func viewDidAppear(animated: Bool) {
        
        let scollViewFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - GC.TAB_BAR_HEIGHT)
        scrollView = MSScrollView(frame: scollViewFrame)
        self.view.addSubview(scrollView)

    }
    
    public func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        print("Scrolling")
    }
    
}
