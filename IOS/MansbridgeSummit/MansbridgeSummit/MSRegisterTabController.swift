//
//  MSRegisterPageController.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-02.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation
import UIKit

public class MSRegisterTabController : UIViewController, UIWebViewDelegate, NetworkFailureRecovery {
    
    var webView : UIWebView!
    var activityIndicator : UIActivityIndicatorView!
    weak var networkErrorView : UIView?
    
    let website = "http://www.mta.ca/Community/Campus_life/Campus_events/Mansbridge_Summit/Application/Mansbridge_Summit_application_form/"
    var connection = Reachability(hostName: "www.mta.ca")
    
    var ignoreNotification : Bool = false
    
    /* Set up the tab */
    override public func viewDidLoad() {

        // Hide status bar
        self.navigationController?.navigationBar.hidden = true
        
        // subscribe to knowing the network status
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "networkStatusDidChange", name: kReachabilityChangedNotification, object: nil)
        connection.startNotifier()

    }
    
    private func addWebView() -> Void {
        webView = UIWebView(frame: CGRect(x: 0, y: 0, width: GC.SCREEN_WIDTH, height: GC.SCREEN_HEIGHT - GC.TAB_BAR_HEIGHT))
        webView.delegate = self;
        webView.scrollView.minimumZoomScale = 0.1;
        webView.loadRequest(NSURLRequest(URL: NSURL(string: website)!))
        self.view.addSubview(webView)
    }
    
    public override func viewDidAppear(animated: Bool) {
        
        super.viewDidLoad()
        
        addWebView()
        displayLoadingAnimation()

    }
    
    public override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    public func networkStatusDidChange() -> Void {
    
        if !ignoreNotification {
            print( connection.isReachable() )
        }

        ignoreNotification = !ignoreNotification
        
    }
    
    /* Add an indicator that the webpage is loading */
    private func displayLoadingAnimation( ) -> Void {
        
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.view.center
        activityIndicator.activityIndicatorViewStyle = .Gray
        
        self.view.addSubview(activityIndicator)

        activityIndicator.startAnimating()
        
    }
    
    /* Display a screen which indicates to the user that there was a problem with the Internet connection */
    func displayNetworkConnectionErrorView() -> Void {
        
        // Remove webview
        if webView != nil {
            webView.removeFromSuperview()
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
    
    // NOTE: Currently un-used
    func removeNetworkConnectionErrorView() -> Void {
        
        if networkErrorView != nil {
           networkErrorView!.removeFromSuperview()
        }
        
    }
    
    public func webViewDidStartLoad(webView: UIWebView) {
        
    }
    
    /* Catch any errors when trying to load webpage */
    public func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        
        if let _error = error {
            print(_error.description)
        }
        
        displayNetworkConnectionErrorView()
        
    }
    
    /* Intercept URL requests and display an error screen if there is no Internet connection */
    public func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
       
        if connection.isReachable() {
            return true
        } else {
            displayNetworkConnectionErrorView()
            return false
        }
        
    }

    /* Execute once the webpage has finished loading */
    public func webViewDidFinishLoad(webView: UIWebView) {
        
        // Turn off loading indicator
        activityIndicator.stopAnimating()
        
        // Display success screen if the application was accepted by the website
        let html : String? = webView.stringByEvaluatingJavaScriptFromString("document.documentElement.outerHTML")
        if html != nil && html!.rangeOfString("for filling out the Mansbridge Summit application form") != nil {
            if let registrationSuccessView = UIView.loadFromNibNamed("RegistrationSuccessXIB") {
                registrationSuccessView.frame = self.view.frame
                self.view.addSubview(registrationSuccessView)
                webView.removeFromSuperview()
            }
        }
        
        // Inject JavaScript into the page to hide the stuff we do not want to see
        webView.stringByEvaluatingJavaScriptFromString("document.getElementsByClassName(\"page-header\")[0].style.display = 'none';")
        webView.stringByEvaluatingJavaScriptFromString("document.getElementsByClassName(\"row\")[1].style.display = 'none';")
        webView.stringByEvaluatingJavaScriptFromString("document.getElementsByClassName(\"page-footer\")[0].style.display = 'none';")
        webView.stringByEvaluatingJavaScriptFromString("document.getElementById(\"breadcrumb-container\").style.display = 'none';")
        
        // Adjust the width of the content boxes if the user is running the app on an iPad
        if GC.DeviceType.iPad {
            webView.stringByEvaluatingJavaScriptFromString("document.getElementById(\"Question1\").style.width = '\(GC.SCREEN_WIDTH - 100)px';")
            webView.stringByEvaluatingJavaScriptFromString("document.getElementById(\"Question2\").style.width = '\(GC.SCREEN_WIDTH - 100)px';")
        }
        
        // Center the content (which makes the submit button look better)
        webView.stringByEvaluatingJavaScriptFromString("document.getElementById(\"ctl00_PageContent_FormBlock1_content\").setAttribute(\"align\", \"center\");")
        
        // webView.stringByEvaluatingJavaScriptFromString("document.getElementById(\"ctl00_PageContent_Label1\").style.textAlign = 'center';")
        
    }

}