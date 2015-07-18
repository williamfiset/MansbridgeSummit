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
    
    // Text Area
    var textField : UITextField!
    
    // Question
    var questionText : String?
    var questionLabel : UILabel!
    
    // Buttons
    var prevButton : UIButton!
    var nextButton : UIButton!
    let prevButtonSize = CGRect(x: 80, y: 300, width: 125, height: 80)
    let nextButtonSize = CGRect(x: 30, y: 30, width: 100, height: 100)
    
    public override func viewDidLoad() {
        
//        textField = UITextField(frame: smallTextArea)
//        prevButton = UIButton(frame: prevButtonSize)
//        nextButton = UIButton(frame: nextButtonSize)
//        
//        self.view.addSubview(textField)
//        self.view.addSubview(prevButton)
//        self.view.addSubview(nextButton)
        
    }
    
    
    public override func viewWillAppear(animated: Bool) {
        
        createTextField()
        createButtons()
        
        self.view.addSubview(textField)
        self.view.addSubview(prevButton)
        self.view.addSubview(nextButton)

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
        let prevButtonY : CGFloat = textField.frame.origin.y + (textField.frame.width * 0.2)
        let prevButtonWidth : CGFloat = (textField.frame.width - space*3) / 2
        let prevButtonHeight : CGFloat = 50
        
        let nextButtonX : CGFloat = prevButtonX + prevButtonWidth + space
        let nextButtonY : CGFloat = prevButtonY
        let nextButtonWidth : CGFloat = prevButtonWidth
        let nextButtonHeight: CGFloat  = 50

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


























