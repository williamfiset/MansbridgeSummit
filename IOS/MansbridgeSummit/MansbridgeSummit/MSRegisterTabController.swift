//
//  MSRegisterPageController.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-02.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation
import UIKit


public class MSRegisterTabController : UIViewController {
    
    // Buttons
    var prevButton : UIButton!
    var nextButton : UIButton!
    
    // Text Area
    var textField : UITextField!
   
    // Question
    var questionText : String?
    var questionLabel : UILabel!
    
    var questionIndex = 0;
    
    let questions = [
        "Enter your name",
        "Please supply your email address",
//        Gender radio buttons
//        "Intended Major/Minor",
//        "Expected year of graduation",
        "Hometown",
        "Dietary restrictions",
        //  I hereby give my permission for pictures and recordings of myself to be published. 
        // Application Questions
        "Does Canada need a public broadcaster? Why or why not?",
        "What is your favourite show that you watched as a kid on public television?"
    ]
    
    func nextQuestion() -> String? {
        
        if questionIndex < questions.count {
            let questionText = questions[questionIndex]
            questionIndex++
            return questionText
        }
        return nil
        
    }
    
    public override func viewDidLoad() {
        
        
    }
    
    
    public override func viewWillAppear(animated: Bool) {
        
        createQuestionLabel()
        createTextField()
        createButtons()
        
        self.view.addSubview(textField)
        self.view.addSubview(prevButton)
        self.view.addSubview(nextButton)

    }
    
    private func createQuestionLabel() -> Void {
        
    }
    
    private func createTextField() -> Void {
        
        let boxWidth  = GC.SCREEN_WIDTH * 0.75
        let boxHeight = GC.SCREEN_HEIGHT * 0.3
        let x = (GC.SCREEN_WIDTH - boxWidth) / 2
        let y = x
        
        textField = UITextField(frame: CGRect(x: x, y: y, width: boxWidth, height: boxHeight))
        textField.backgroundColor = GC.Color.gold

    }
    
    private func createButtons() -> Void {
        
        let space = (textField.frame.width * 0.3) / 3
        
        let prevButtonX : CGFloat = textField.frame.origin.x + space
        let prevButtonY : CGFloat = textField.frame.origin.y + textField.frame.height + (textField.frame.height * 0.1)
        let prevButtonWidth : CGFloat = (textField.frame.width - space*3) / 2
        let prevButtonHeight : CGFloat = (textField.frame.height * 0.2)
        
        let nextButtonX : CGFloat = prevButtonX + prevButtonWidth + space
        let nextButtonY : CGFloat = prevButtonY
        let nextButtonWidth : CGFloat = prevButtonWidth
        let nextButtonHeight: CGFloat  = prevButtonHeight

        let prevButtonFrame = CGRect(x: prevButtonX, y: prevButtonY, width: prevButtonWidth, height: prevButtonHeight)
        let nextButtonFrame = CGRect(x: nextButtonX, y: nextButtonY, width: nextButtonWidth, height: nextButtonHeight)
        
        prevButton = UIButton(frame: prevButtonFrame)
        prevButton.backgroundColor = GC.Color.red
        prevButton.setTitle("Prev", forState: UIControlState.Normal)
        
        nextButton = UIButton(frame: nextButtonFrame)
        nextButton.setTitle("Next", forState: UIControlState.Normal)
        nextButton.backgroundColor = GC.Color.red
        
    }
    
}


























