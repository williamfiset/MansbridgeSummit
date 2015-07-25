//
//  PageContentViewController.swift
//  MansbridgeSummit
//
//  Created by Micah Stairs on 2015-07-24.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {
    
    var pageIndex: Int?

}

class SpeakerViewController: PageContentViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let image = UIImage(named: "Speaker\(pageIndex!)")
        let imageView = UIImageView(image: image)
        imageView.frame = self.view.frame
        self.view.addSubview(imageView)
    
    }
}

class HomeViewController: PageContentViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let scollViewFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - GC.TAB_BAR_HEIGHT)
        let scrollView = MSScrollView(frame: scollViewFrame)
        self.view.addSubview(scrollView)
        
    }
}