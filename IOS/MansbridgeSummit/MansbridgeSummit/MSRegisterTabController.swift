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
    var activityIndicator : UIActivityIndicatorView!
    
    let website = "http://www.mta.ca/Community/Campus_life/Campus_events/Mansbridge_Summit/Application/Mansbridge_Summit_application_form/"
    let webviewFrame = CGRectMake(0, 0, GC.SCREEN_WIDTH, GC.SCREEN_HEIGHT - GC.TAB_BAR_HEIGHT )
    
    weak var networkErrorView : UIView? = nil
    
    override public func viewDidLoad() {
        
        super.viewDidLoad()
        
        let connection = Reachability(hostName: "www.mta.ca")
        
        if connection.isReachable() {
        
            webView = UIWebView(frame: webviewFrame)

            webView.delegate = self;
            webView.scrollView.minimumZoomScale = 0.1;
            webView.loadRequest(NSURLRequest(URL: NSURL(string: website)!))
            self.view.addSubview(webView)
            displayLoadingAnimation()
       
        } else {
            displayNetworkConnectionErrorPage()
        }

    }

    /* Add loading animation */
    private func displayLoadingAnimation() -> Void {
        
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.view.center
        activityIndicator.activityIndicatorViewStyle = .Gray
        
        self.view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        
    }
    
    private func displayNetworkConnectionErrorPage() -> Void {
        
        // Remove webview
        if webView != nil {
            webView.removeFromSuperview()
        }
        
        // Load XIB File only if the error page does not exist
        if networkErrorView == nil {
            if let _networkErrorView = UIView.loadFromNibNamed("NetworkErrorXIB") {
                networkErrorView = _networkErrorView
                self.view.addSubview(_networkErrorView)
            }
        }
        
    }
    
    private func removeNetworkConnectionErrorPage() -> Void {
        
        if networkErrorView != nil {
           networkErrorView!.removeFromSuperview()
        }
        
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
        
        // Turn off loading indicator
        activityIndicator.stopAnimating()
        
        // Inject JavaScript into the page to hide the stuff we do not want to see
        webView.stringByEvaluatingJavaScriptFromString("document.getElementsByClassName(\"page-header\")[0].style.display = 'none';")
        webView.stringByEvaluatingJavaScriptFromString("document.getElementsByClassName(\"page-footer\")[0].style.display = 'none';")
        webView.stringByEvaluatingJavaScriptFromString("document.getElementById(\"breadcrumb-container\").style.display = 'none';")
        
    }
    
}