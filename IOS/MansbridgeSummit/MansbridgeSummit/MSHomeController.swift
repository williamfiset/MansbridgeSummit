//
//  ViewController.swift
//  MansbridgeSummit
//
//  Created by Micah Stairs on 2015-07-24.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import UIKit

class MSHomeController: UIViewController, UIPageViewControllerDelegate {
    
    var pageViewController: UIPageViewController!
    var modelController = MSHomeModelController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the page view controller and add it as a child view controller.
        self.pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        self.pageViewController.delegate = self
        self.pageViewController.dataSource = self.modelController
        
        setInitialViewController()
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        
        self.pageViewController.didMoveToParentViewController(self)
        
        // Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
        self.view.gestureRecognizers = self.pageViewController.gestureRecognizers
        
    }
    
    func setInitialViewController () {
        
        let firstController = self.modelController.pageControllers[0]
        let viewControllers = [firstController]
        self.pageViewController.setViewControllers(viewControllers, direction: .Forward, animated: false, completion: {done in })
        
    }
    
}


