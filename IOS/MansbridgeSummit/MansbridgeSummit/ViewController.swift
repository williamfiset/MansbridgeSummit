//
//  ViewController.swift
//  MansbridgeSummit
//
//  Created by Micah Stairs on 2015-07-24.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    
    let N_PAGES = 5
    var pageUpdateTimer : NSTimer?
//    var currentIndex = 0
    
    var pageViewController : UIPageViewController!
    
    func reset() {
        
        /* Getting the page View controller */
        let dict = Dictionary<String, AnyObject>()
        pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: dict)
        self.pageViewController.dataSource = self
        
        let pageContentViewController = self.viewControllerAtIndex(0)
        self.pageViewController.setViewControllers([pageContentViewController!], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        self.addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
        
        pageUpdateTimer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "switchPages", userInfo: nil, repeats: true)
    }
    
    func switchPages() {
        
        let currentIndex = (self.pageViewController.viewControllers?.last as! PageContentViewController).pageIndex!
        
        switchPages((currentIndex + 1) % N_PAGES)
    }
    
    func switchPages(newIndex : Int) {
        let pageContentViewController = self.viewControllerAtIndex(newIndex)
        self.pageViewController.setViewControllers([pageContentViewController!], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
    
        var index = (viewController as! PageContentViewController).pageIndex!
        
        index++
        
        if (index >= N_PAGES) {
            return nil
        }
        
        return self.viewControllerAtIndex(index)
    
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
    
        var index = (viewController as! PageContentViewController).pageIndex!
            if (index <= 0) {
            return nil
        }
    
        index--
    
        return self.viewControllerAtIndex(index)
    
    }
    
    func viewControllerAtIndex(index : Int) -> UIViewController? {
        
        if (index < 0 || index >= N_PAGES) {
            
            return nil
            
        } else if (index == 0) {
            
            let pageContentViewController = HomeViewController()
            pageContentViewController.pageIndex = index
            return pageContentViewController
            
        } else {
            
            let pageContentViewController = SpeakerViewController()
            pageContentViewController.pageIndex = index
            return pageContentViewController
            
        }
        
        
    }
    
}