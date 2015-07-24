//
//  Constants.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-03.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation
import UIKit



// GC <=> GlobalConstant
public struct GC {
    
    private static let screenRect = UIScreen.mainScreen().bounds

    static let SCREEN_WIDTH : CGFloat = screenRect.size.width
    static let SCREEN_HEIGHT : CGFloat = screenRect.size.height

    static let TAB_BAR_HEIGHT = MSTabBarController().tabBar.frame.height
    
    struct DeviceType {
        static let iPhone : Bool = UIDevice.currentDevice().userInterfaceIdiom == .Phone
        static let iPad   : Bool = UIDevice.currentDevice().userInterfaceIdiom == .Pad
    }
    
    struct Color {
        static let gold  = UIColor(red: 175.0/255.0, green: 137.0/255.0, blue: 0, alpha: 1)
        static let red   = UIColor(red: 135.0/255.0, green: 36.0/255.0, blue: 52.0/255.0, alpha: 1)
        static let white = UIColor.whiteColor()
    }
    
    // Clean up unused fonts
    struct Font {
        
        static let garamond_12 = UIFont(name: "AppleGaramond", size: 12.0)
        static let garamond_14 = UIFont(name: "AppleGaramond", size: 14.0)
        static let garamond_16 = UIFont(name: "AppleGaramond", size: 16.0)
        static let garamond_18 = UIFont(name: "AppleGaramond", size: 18.0)
        static let garamond_20 = UIFont(name: "AppleGaramond", size: 20.0)
        static let garamond_22 = UIFont(name: "AppleGaramond", size: 22.0)
        static let garamond_24 = UIFont(name: "AppleGaramond", size: 24.0)
        static let garamond_26 = UIFont(name: "AppleGaramond", size: 26.0)
        static let garamond_28 = UIFont(name: "AppleGaramond", size: 28.0)
        static let garamond_30 = UIFont(name: "AppleGaramond", size: 30.0)
        static let garamond_32 = UIFont(name: "AppleGaramond", size: 32.0)
        static let garamond_50 = UIFont(name: "AppleGaramond", size: 50.0)
        
        static let garamond_bold_12 = UIFont(name: "AppleGaramond-Bold", size: 12.0)
        static let garamond_bold_14 = UIFont(name: "AppleGaramond-Bold", size: 14.0)
        static let garamond_bold_16 = UIFont(name: "AppleGaramond-Bold", size: 16.0)
        static let garamond_bold_18 = UIFont(name: "AppleGaramond-Bold", size: 18.0)
        static let garamond_bold_20 = UIFont(name: "AppleGaramond-Bold", size: 20.0)
        static let garamond_bold_22 = UIFont(name: "AppleGaramond-Bold", size: 22.0)
        static let garamond_bold_24 = UIFont(name: "AppleGaramond-Bold", size: 24.0)
        static let garamond_bold_26 = UIFont(name: "AppleGaramond-Bold", size: 26.0)
        static let garamond_bold_28 = UIFont(name: "AppleGaramond-Bold", size: 28.0)
        static let garamond_bold_30 = UIFont(name: "AppleGaramond-Bold", size: 30.0)
        static let garamond_bold_32 = UIFont(name: "AppleGaramond-Bold", size: 32.0)
        static let garamond_bold_50 = UIFont(name: "AppleGaramond-Bold", size: 50.0)
        
        static let myraidpro_12 = UIFont(name: "MyriadPro-Regular", size: 12.0)
        static let myraidpro_14 = UIFont(name: "MyriadPro-Regular", size: 14.0)
        static let myraidpro_16 = UIFont(name: "MyriadPro-Regular", size: 16.0)
        static let myraidpro_18 = UIFont(name: "MyriadPro-Regular", size: 18.0)
        static let myraidpro_20 = UIFont(name: "MyriadPro-Regular", size: 20.0)
        static let myraidpro_22 = UIFont(name: "MyriadPro-Regular", size: 22.0)
        static let myraidpro_24 = UIFont(name: "MyriadPro-Regular", size: 24.0)
        static let myraidpro_26 = UIFont(name: "MyriadPro-Regular", size: 26.0)
        static let myraidpro_28 = UIFont(name: "MyriadPro-Regular", size: 28.0)
        static let myraidpro_30 = UIFont(name: "MyriadPro-Regular", size: 30.0)
        static let myraidpro_32 = UIFont(name: "MyriadPro-Regular", size: 32.0)
        static let myraidpro_50 = UIFont(name: "MyriadPro-Regular", size: 50.0)
        
        static let myraidpro_bold_12 = UIFont(name: "MyriadPro-Bold", size: 12.0)
        static let myraidpro_bold_14 = UIFont(name: "MyriadPro-Bold", size: 14.0)
        static let myraidpro_bold_16 = UIFont(name: "MyriadPro-Bold", size: 16.0)
        static let myraidpro_bold_18 = UIFont(name: "MyriadPro-Bold", size: 18.0)
        static let myraidpro_bold_20 = UIFont(name: "MyriadPro-Bold", size: 20.0)
        static let myraidpro_bold_22 = UIFont(name: "MyriadPro-Bold", size: 22.0)
        static let myraidpro_bold_24 = UIFont(name: "MyriadPro-Bold", size: 24.0)
        static let myraidpro_bold_26 = UIFont(name: "MyriadPro-Bold", size: 26.0)
        static let myraidpro_bold_28 = UIFont(name: "MyriadPro-Bold", size: 28.0)
        static let myraidpro_bold_30 = UIFont(name: "MyriadPro-Bold", size: 30.0)
        static let myraidpro_bold_32 = UIFont(name: "MyriadPro-Bold", size: 32.0)
        static let myraidpro_bold_50 = UIFont(name: "MyriadPro-Bold", size: 50.0)
        
    }

    
}

















