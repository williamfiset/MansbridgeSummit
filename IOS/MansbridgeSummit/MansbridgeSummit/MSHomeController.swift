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
        
        self.pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        self.pageViewController.delegate = self
        self.pageViewController.dataSource = self.modelController
        
        setInitialViewController()
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        
        self.pageViewController.didMoveToParentViewController(self)
       
    }
    
    func setInitialViewController () {
        
        let firstController = self.modelController.pageControllers[0]
        let viewControllers = [firstController]
        self.pageViewController.setViewControllers(viewControllers, direction: .Forward, animated: false, completion: {done in })
        
    }
   
}


