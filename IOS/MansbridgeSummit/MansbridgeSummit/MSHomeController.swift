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
    
    // Select the first dot right before the view is about to appear
    override func viewWillAppear(animated: Bool) {

        super.viewWillAppear(animated)
        dotController.updateDots(NSIndexPath(forRow: 0, inSection: 0))
        
    }
    
    // Initialize Page Controller
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
    
    func setDots() -> Void {
        
        // Places speakers above the page view controller content
        self.view.addSubview(dotController.collectionView!)
        
    }
    
    func setInitialViewController () {
        
        // Get the first view controller
        let firstController = self.modelController.pageControllers[0]
        self.modelController.currentController = firstController
        
        // Actually change the page
        let viewControllers = [firstController]
        self.pageViewController.setViewControllers(viewControllers, direction: .Forward, animated: false, completion: {done in })
        
        // House-keeping stuff
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
        
    }
   
    
        /* PAGE VIEW CONTROLLER DELEGATE METHODS */
    
    
    // Called when transitioning to another view controller
    func pageViewController(currentPageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {
        
        if pendingViewControllers.count > 0 {
            let nextController = pendingViewControllers[0]
            if let controllerIndex = self.modelController.pageControllers.indexOf(nextController) {
                self.currentControllerIndex = controllerIndex
                dotController.updateDots(NSIndexPath(forRow: controllerIndex, inSection: 0))
            }
        }
        
    }
    
    // Called when the transition is finished
    // NOTE: This method is necessary, otherwise we can get a weird bug where if the user starts to swipe to another page, but then stops, the dot won't be updated properly
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if let controllerIndex = self.modelController.pageControllers.indexOf(pageViewController.viewControllers![0]) {
            self.currentControllerIndex = controllerIndex
            dotController.updateDots(NSIndexPath(forRow: controllerIndex, inSection: 0))
        }
        
    }
    
    
}


