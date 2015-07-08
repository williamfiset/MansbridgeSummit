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
    
    var eventPageView : MSEventPageView!

    public override func viewWillAppear(animated: Bool) {

        super.viewWillAppear(animated);
        
        // Navigation bar is essential to go back, unless we make a back button
        
        self.eventPageView = view as! MSEventPageView
        eventPageView.returnButton.addTarget(self, action: "returnButtonClick", forControlEvents: .TouchUpInside)
        
    }
    
    public override func viewDidLoad() {
        
        view.backgroundColor = UIColor.whiteColor()
        self.navigationController?.popToRootViewControllerAnimated(true);

    }
    
    
    public func returnButtonClick() -> Void {
    
        self.navigationController?.popToRootViewControllerAnimated(true);
        
    }
    
}






