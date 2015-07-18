//
//  MSTabBarController.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-02.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation
import UIKit


public class MSTabBarController : UITabBarController {

    static let tabBarItemNames = ["Home", "Register", "Twitter", "Schedule", "About"]
    static let tabBarItemImageNames = ["tabBarHomeIcon", "tabBarRegisterIcon", "tabBarTwitterIcon", "tabBarScheduleIcon", "tabBarAboutIcon"]

    public override func viewDidLoad() {
        setTabBarImages()
    }

    public override func viewWillAppear(animated: Bool) {

        //self.tabBar.alpha = 1.0
        self.tabBar.backgroundColor = GC.Color.red
        self.tabBar.barTintColor = GC.Color.red
        self.tabBar.tintColor = GC.Color.white
        
        UIApplication.sharedApplication().keyWindow?.tintColor = UIColor.blueColor()
        
    }
    
    func setTabBarImages() -> Void {
        
        if let tabBarItems = self.tabBar.items {
            for (index, tabBarItem) in tabBarItems.enumerate() {

                let itemName = MSTabBarController.tabBarItemNames[index]
                tabBarItem.title = itemName
                
                // UIImageRenderingModeAutomatic,          Use the default rendering mode for the context where the image is used
                // UIImageRenderingModeAlwaysOriginal,     Always draw the original image, without treating it as a template
                // UIImageRenderingModeAlwaysTemplate,     Always draw the image as a template image, ignoring its color information
                
                let iconName = MSTabBarController.tabBarItemImageNames[index]
                if let icon = UIImage(named: iconName)?.imageWithRenderingMode(.AlwaysOriginal) {
                    tabBarItem.image = icon
                }

                
            }
        }
                
    }
    

}


