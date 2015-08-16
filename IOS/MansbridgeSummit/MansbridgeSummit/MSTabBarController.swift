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
    
    let tabBarItemNames = ["Home", "Register", "Twitter", "Schedule", "QR Codes"]
    let tabBarItemImageNames = ["tabBarHomeIcon", "tabBarRegisterIcon", "tabBarTwitterIcon", "tabBarScheduleIcon", "tabBarQRCodeIcon"]


    public override func viewWillAppear(animated: Bool) {
        self.tabBar.tintColor = GC.Color.red
        self.tabBar.translucent = false
    }
    
    public override func viewDidAppear(animated: Bool) {
        setTabBarImages()
    }
    
    func setTabBarImages() -> Void {
        
        if let tabBarItems = self.tabBar.items {
            for (index, tabBarItem) in tabBarItems.enumerate() {
                
                let itemName = tabBarItemNames[index]
                tabBarItem.title = itemName
                
                let iconName = tabBarItemImageNames[index]
                if let icon = UIImage(named: iconName)?.imageWithRenderingMode(.Automatic) {
                    tabBarItem.image = icon
                }
            }
                
        }
    }


}