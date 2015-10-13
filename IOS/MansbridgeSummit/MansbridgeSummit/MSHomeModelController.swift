//
//  HomeModelController.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-29.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation
import UIKit

class MSHomeModelController : NSObject, UIPageViewControllerDataSource {
    
    var pageControllers : [UIViewController]  = []
    var currentController : UIViewController!
    
    var MAX_PAGES : Int {
        return pageControllers.count
    };
    
    override init() {
        
        super.init()
        createViewControllers()
        
    }
    
    func createViewControllers() -> Void {

        pageControllers.append( MSFrontPageController() )
        pageControllers.append( MSSpeakerController() )
        pageControllers.append( MSSpeakerController() )
        pageControllers.append( MSSpeakerController() )
        pageControllers.append( MSSpeakerController() )
        
    }
    
    // Return the data view controller for the given index.
    func viewControllerAtIndex(index: Int) -> UIViewController! {
        if 0 <= index && index < MAX_PAGES {
            return pageControllers[index]
        } else {
            return nil
        }
    }
    
    func indexOfViewController(viewController: UIViewController) -> Int {
        return pageControllers.indexOf(viewController) ?? NSNotFound
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let index = self.indexOfViewController(viewController)
        
        if index == 0 || index == NSNotFound {
            return nil
        } else {
            return self.viewControllerAtIndex(index - 1)
        }
        
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let index = self.indexOfViewController(viewController)
        if index == NSNotFound { return nil }
        if index + 1 < MAX_PAGES {
            return self.viewControllerAtIndex(index + 1)
        }
        return nil
        
    }



    
}
