//
//  FormatHTML.swift
//  MansbridgeSummit
//
//  Created by Micah Stairs on 2015-07-18.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import UIKit
import Foundation
    
//    func startAt(start : String) -> String? {
//        
//        let range = self.rangeOfString(start)
//        
//        if (range != nil) {
//            return self.substringFromIndex(range!.endIndex)
//        }
//        
//        return nil;
//        
//    }
//    
//    func endAt(end : String) -> String? {
//        
//        let range = self.rangeOfString(end)
//        
//        if (range != nil) {
//            return self.substringToIndex(range!.startIndex)
//        }
//        
//        return nil;
//        
//    }
//    
//    mutating func replace(string: String, replacement : String) {
//        
//        let range = self.rangeOfString(string)
//        
//        if (range != nil) {
//            self.replaceRange(range!, with: replacement)
//        }
//        
//    }
//    
//    mutating func replaceAll(string: String, replacement : String) {
//        
//        var range = self.rangeOfString(string)
//        
//        while (range != nil) {
//            self.replaceRange(range!, with: replacement)
//            range = self.rangeOfString(string)
//        }
//        
//    }
//    
//    mutating func removeSubstringIfExists(string : String) {
//        let range = self.rangeOfString(string)
//        if (range != nil) {
//            self.removeRange(range!)
//        }
//    }

class FormatHTML : NSObject {
    
    var controller : MSRegisterTabController
    
    var text : String? = nil
    
    var url : NSURL? = nil
    var request : NSMutableURLRequest? = nil
    var response : NSHTTPURLResponse? = nil
    
    var data: NSMutableData? = nil
    var done: (NSError?, NSData?, NSString?) -> () = { (_, _, _) -> () in }
    
    init (controller: MSRegisterTabController, method: String, url: String, done: (NSError?, NSData?, NSString?) -> ()) {
        self.controller = controller
        
        var urlFormatted = String(url)
        urlFormatted.replaceAll(" ", replacement: "%20")
        
        let _url = NSURL(string: urlFormatted)
        self.request = NSMutableURLRequest(URL: _url!)
        self.request!.HTTPMethod = method;
        self.done = done
        self.data = NSMutableData()
    }
    
    func start() {
        var _ = NSURLConnection(request: self.request!, delegate: self, startImmediately: true)
    }
    
    class func get (controller: MSRegisterTabController, url: String, done: (NSError?, NSData?, NSString?) -> ()) -> Void {
        return FormatHTML(controller: controller, method: "GET", url: url, done: done).start();
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
        self.data!.appendData(data)
    }
    
    func connection(connection: NSURLConnection!, didReceiveResponse response: NSHTTPURLResponse!) {
        self.response = response
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        
        /* Setup */
        
        var text = String(NSString(data: self.data!, encoding: NSUTF8StringEncoding)!)
        
        /* Trim starting chunk */
        
        if (text.rangeOfString("<div class=\"content\">") != nil) {
            text = "<!DOCTYPE html><html><body>" + text.startAt("<div class=\"content\">")!
        }
        
        /* Trim ending chunk */
        
        if (text.rangeOfString("<footer class=\"page-footer\">") != nil) {
            text = text.endAt("<footer class=\"page-footer\">")! + "</body></html>"
        }
            
       //
//        /* Removes the version display */
//        
//        text.removeSubstringIfExists("<span class=\"passage-display-version\">New Living Translation (NLT)</span>")
//        
//        /* Make all chapter numbers larger */
//        
//        var start : String?
//        var end : String?
//        start = String(text).endAt("class=\"chapternum\"")
//        end = String(text).startAt("class=\"chapternum\"")
//        
//        while (start != nil && end != nil) {
//            text = start! + "style=\"font-size: 200%\"" + end!
//            start = String(text).endAt("class=\"chapternum\"")
//            end = String(text).startAt("class=\"chapternum\"")
//        }
//        
//        /* Add version display */
//        
//        text.replace("</span></h1>", replacement : " (\(controller.version))</span></h1>");
        
        /* Save text */
        
        controller.returnedText = text
        self.done(nil, self.data!, text)
        
    }
    
    func connection(connection: NSURLConnection!, didFailWithError error: NSError!) {
        self.done(error, nil, nil)
    }
    
    
    //NSURLConnectionDelegate
    func connection(connection: NSURLConnection, canAuthenticateAgainstProtectionSpace protectionSpace: NSURLProtectionSpace?) -> Bool
    {
        return protectionSpace?.authenticationMethod == NSURLAuthenticationMethodServerTrust
    }
    
    func connection(connection: NSURLConnection, didReceiveAuthenticationChallenge challenge: NSURLAuthenticationChallenge?)
    {
        if challenge?.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust
        {
            if challenge?.protectionSpace.host == "www.mta.ca"
            {
                let credentials = NSURLCredential(forTrust: challenge!.protectionSpace.serverTrust!)
                challenge!.sender!.useCredential(credentials, forAuthenticationChallenge: challenge!)
            }
        }
        
        challenge?.sender!.continueWithoutCredentialForAuthenticationChallenge(challenge!)
    }
    
}

