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
    
    override public func viewDidLoad() {
        
        super.viewDidLoad()
        
        /* Load and parse HTML */
        
        var wait: Bool = true
        FormatHTML.get(self, url: "http://www.mta.ca/Community/Campus_life/Campus_events/Mansbridge_Summit/Application/Mansbridge_Summit_application_form/", done: { (error: NSError?, data: NSData?, text: NSString?) -> () in
            wait = false
        })
        waitFor(&wait)
        
        /* Display web view */
        
        webView = UIWebView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        webView!.scrollView.minimumZoomScale = 0.1;
        webView!.loadHTMLString(returnedText!, baseURL: NSURL(string: "http://www.mta.ca/Community/Campus_life/Campus_events/Mansbridge_Summit/Application/Mansbridge_Summit_application_form/"))
        
        webView!.delegate = self;
        self.view.addSubview(webView!)
        
        /* Add loading animation */
        
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.view.center
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        let connection = Reachability(hostName: "www.mta.ca")
        if connection.isReachable() {
            
            // Load storyboard, otherwise 
            
        } else {
            let warningLabel = UILabel(frame: CGRect(x: 0, y: 0, width: GC.SCREEN_WIDTH, height: GC.SCREEN_HEIGHT))
            warningLabel.text = "Please make sure you are connected to the network."
            
            self.view.addSubview(warningLabel)
        }
        
//        createQuestionLabel()
//        createTextField()
//        createButtons()
//        
//        self.view.addSubview(textField)
//        self.view.addSubview(prevButton)
//        self.view.addSubview(nextButton)

    }
    
    public func webViewDidFinishLoad(webView: UIWebView) {
        activityIndicator.stopAnimating()
    }
    
    func waitFor (inout wait: Bool) {
        while (wait) {
            NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 0.1))
        }
    }
    
    func orientationChange() {
        
        webView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height)
        
        if activityIndicator != nil {
            activityIndicator.center = self.view.center
        }
        
    }
//    
//    // Buttons
//    var prevButton : UIButton!
//    var nextButton : UIButton!
//    
//    // Text Area
//    var textField : UITextField!
//   
//    // Question
//    var questionText : String?
//    var questionLabel : UILabel!
//    
//    var questionIndex = 0;
//    
//    let questions = [
//        "Enter your name",
//        "Please supply your email address",
////        Gender radio buttons
////        "Intended Major/Minor",
////        "Expected year of graduation",
//        "Hometown",
//        "Dietary restrictions",
//        //  I hereby give my permission for pictures and recordings of myself to be published. 
//        // Application Questions
//        "Does Canada need a public broadcaster? Why or why not?",
//        "What is your favourite show that you watched as a kid on public television?"
//    ]
//    
//    func nextQuestion() -> String? {
//        
//        if questionIndex < questions.count {
//            let questionText = questions[questionIndex]
//            questionIndex++
//            return questionText
//        }
//        return nil
//        
//    }
    
//    public override func viewWillAppear(animated: Bool) {
//        
//        createQuestionLabel()
//        createTextField()
//        createButtons()
//        
//        self.view.addSubview(textField)
//        self.view.addSubview(prevButton)
//        self.view.addSubview(nextButton)
//
//    }
//    
//    private func createQuestionLabel() -> Void {
//        
//    }
//    
//    private func createTextField() -> Void {
//        
//        let boxWidth  = GC.SCREEN_WIDTH * 0.75
//        let boxHeight = GC.SCREEN_HEIGHT * 0.3
//        let x = (GC.SCREEN_WIDTH - boxWidth) / 2
//        let y = x
//        
//        textField = UITextField(frame: CGRect(x: x, y: y, width: boxWidth, height: boxHeight))
//        textField.backgroundColor = GC.Color.gold
//
//    }
//    
//    private func createButtons() -> Void {
//        
//        let space = (textField.frame.width * 0.3) / 3
//        
//        let prevButtonX : CGFloat = textField.frame.origin.x + space
//        let prevButtonY : CGFloat = textField.frame.origin.y + textField.frame.height + (textField.frame.height * 0.1)
//        let prevButtonWidth : CGFloat = (textField.frame.width - space*3) / 2
//        let prevButtonHeight : CGFloat = (textField.frame.height * 0.2)
//        
//        let nextButtonX : CGFloat = prevButtonX + prevButtonWidth + space
//        let nextButtonY : CGFloat = prevButtonY
//        let nextButtonWidth : CGFloat = prevButtonWidth
//        let nextButtonHeight: CGFloat  = prevButtonHeight
//
//        let prevButtonFrame = CGRect(x: prevButtonX, y: prevButtonY, width: prevButtonWidth, height: prevButtonHeight)
//        let nextButtonFrame = CGRect(x: nextButtonX, y: nextButtonY, width: nextButtonWidth, height: nextButtonHeight)
//        
//        prevButton = UIButton(frame: prevButtonFrame)
//        prevButton.backgroundColor = GC.Color.red
//        prevButton.setTitle("Prev", forState: UIControlState.Normal)
//        
//        nextButton = UIButton(frame: nextButtonFrame)
//        nextButton.setTitle("Next", forState: UIControlState.Normal)
//        nextButton.backgroundColor = GC.Color.red
//        
//    }
    
}


























