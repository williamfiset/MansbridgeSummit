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

    var dotController: DotController!
    
    var currentControllerIndex = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        createPageViewController()
        setInitialViewController()
        
        createDotController()
        setDots()
        
    }
    
    // Initailize Page Controller
    private func createPageViewController() {
        
        self.pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        self.pageViewController.dataSource = self.modelController
        self.pageViewController.delegate = self
        
    }
    
    private func createDotController() {
        
        let horizontalFlowLayout = UICollectionViewFlowLayout()
        horizontalFlowLayout.scrollDirection = .Horizontal
        
        dotController = DotController(collectionViewLayout: horizontalFlowLayout)
        self.addChildViewController(self.dotController)
        
    }
    
    func setDots ( ) -> Void {
        
        // Places Speakers above the page view controller content
        self.view.addSubview(dotController.collectionView!)
        
    }
    
    func setInitialViewController () {
        
        // Get the first view controller
        let firstController = self.modelController.pageControllers[0]
        self.modelController.currentController = firstController
        
        // Actually change the page
        let viewControllers = [firstController]
        self.pageViewController.setViewControllers(viewControllers, direction: .Forward, animated: false, completion: {done in })
        
        // House keeping stuffz
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
        
    }
   
    
        /* PAGE VIEW CONTROLLER DELEGATE METHODS */
    
    
    // Called when transitioning to another view controller
    func pageViewController(currentPageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {

        if pendingViewControllers.count > 0 {
            let nextController = pendingViewControllers[0]
            if let controllerIndex = self.modelController.pageControllers.indexOf( nextController ) {
                self.currentControllerIndex = controllerIndex
            }
        }
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
    }
    
    
}


