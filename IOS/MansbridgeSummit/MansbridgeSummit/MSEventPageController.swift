//
//  MSEventPageController.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-07.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation
import UIKit


public class MSEventPageController : UIViewController {

    
    var returnButton = UIButton();
    
    public override func viewWillAppear(animated: Bool) {

        super.viewWillAppear(animated);
        
        // Navigation bar is essential to go back, unless we make a back button
        self.navigationController!.navigationBar.hidden = false
        createReturnButton();
        self.view.addSubview(returnButton)
        
    }
    
    public override func viewDidLoad() {
        
        view.backgroundColor = UIColor.whiteColor()
        self.navigationController?.popToRootViewControllerAnimated(true);
        
    }
    
    
    private func createReturnButton() -> Void {
        
        returnButton = UIButton(frame: CGRect(x: view.bounds.width/2, y: view.frame.height-100, width: 250, height: 75))
        returnButton.setTitle("Return", forState: UIControlState.Normal)
        
        let actionMethod = Selector("returnButtonClick");
        returnButton.addTarget(self, action: actionMethod, forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    public func returnButtonClick() -> Void {
        self.navigationController?.popToRootViewControllerAnimated(true);
        
    }
    
}






