//
//  MSRegisterPageController.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-02.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation
import UIKit


public class MSRegisterTabController : UIViewController, UIWebViewDelegate {
    
    var webView : UIWebView!
    var activityIndicator: UIActivityIndicatorView!
    
    // Variables used by FormatHTML
    var returnedText : String?
    
    let website = "http://www.mta.ca/Community/Campus_life/Campus_events/Mansbridge_Summit/Application/Mansbridge_Summit_application_form/"
    let webviewFrame = CGRectMake(0, 0, GC.SCREEN_WIDTH, GC.SCREEN_HEIGHT - GC.TAB_BAR_HEIGHT )
    
    override public func viewDidLoad() {
        
        super.viewDidLoad()
        
        let connection = Reachability(hostName: "www.mta.ca")
        
        if connection.isReachable() {
        
            loadWebpageHTML()
            displayWebview()
            displayLoadingAnimation()
       
        } else {
            displayNetworkConnectionErrorPage()
        }

    }

    /* Add loading animation */
    private func displayLoadingAnimation() -> Void {
        
        let ai_frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        activityIndicator = UIActivityIndicatorView(frame: ai_frame)
        activityIndicator.center = self.view.center
        activityIndicator.activityIndicatorViewStyle = .Gray
        
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
    }
    
    /* Display web view */
    private func displayWebview () -> Void {
        
        webView = UIWebView(frame: webviewFrame )
        webView.loadHTMLString(returnedText!, baseURL: NSURL(string: website))
        webView.scrollView.minimumZoomScale = 0.1;
       
        webView.delegate = self;
        
        self.view.addSubview(webView)
        
    }
    
    private func loadWebpageHTML() -> Void {
        
        var wait: Bool = true
        FormatHTML.get(self, url: website, done: {
            (error: NSError?, data: NSData?, text: NSString?) -> () in
            wait = false
        })
        waitFor(&wait)
        
    }
    
    private func displayNetworkConnectionErrorPage() -> Void {
        
        // Remove webview
        if webView != nil {
            webView.removeFromSuperview()
        }
        
        // Load XIB File
        
    }
    
    public func webViewDidStartLoad(webView: UIWebView) {
        
    }
    
    public func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        if let _error = error {
            print(_error.description)
        }
        displayNetworkConnectionErrorPage()
    }
    
    public func webViewDidFinishLoad(webView: UIWebView) {
        activityIndicator.stopAnimating()
    }
    
    private func waitFor (inout wait: Bool) {
        while (wait) {
            NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 0.1))
        }
    }
    
}


























