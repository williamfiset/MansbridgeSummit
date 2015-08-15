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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        self.pageViewController.delegate = self
        self.pageViewController.dataSource = self.modelController
        
        setInitialViewController()
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        
        self.pageViewController.didMoveToParentViewController(self)
        setDots()
    }
    
    func setDots () -> Void {
        
        
        let horizontalFlowLayout = UICollectionViewFlowLayout()
        horizontalFlowLayout.scrollDirection = .Horizontal
        // horizontalFlowLayout.itemSize = CGSize(width: GC.SCREEN_WIDTH, height: GC.TAB_BAR_HEIGHT*2)

        dotController = DotController(collectionViewLayout: horizontalFlowLayout)
        
        if let currentController = modelController.currentController {
            currentController.view.addSubview(dotController.collectionView!)
        }
        
    }
    
    func setInitialViewController () {
        
        let firstController = self.modelController.pageControllers[0]
        self.modelController.currentController = firstController
        let viewControllers = [firstController]
        self.pageViewController.setViewControllers(viewControllers, direction: .Forward, animated: false, completion: {done in })
        
    }
   
    func pageViewController(currentPageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {
        
        self.modelController.currentController = currentPageViewController
        
    }
    
}


