//
//  Dots.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-08-15.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation
import UIKit

class DotController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cell_identifier = "custom_cell_identifier"
    let cellSize : CGFloat = 50.0
    let NUM_DOTS = 5
    
    var lastDotIndexPath : NSIndexPath!
    
    let frame = CGRect(x: 0, y: GC.SCREEN_HEIGHT - 150, width: GC.SCREEN_WIDTH, height: 150)
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        
        super.init(collectionViewLayout: layout)
        collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        setCollectionViewProperties()
        
    }

    private func setCollectionViewProperties() {

        collectionView!.registerClass( Dot.classForCoder(), forCellWithReuseIdentifier: cell_identifier)
        
        collectionView!.bounds = self.frame
        collectionView!.contentSize = CGSize(width: self.frame.width, height: self.frame.height)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.backgroundColor = UIColor.clearColor()
        collectionView!.backgroundView = UIView(frame: CGRectZero)
        collectionView!.frame = self.frame
        
        // DEBUGGIN
//        let bg = UIView(frame: frame)
//        bg.backgroundColor = UIColor.redColor()
//        collectionView!.backgroundColor = UIColor.redColor()
//        collectionView!.backgroundView = bg
        
    }

    
    // Detect click events on the items in the collection
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
        defer {
            lastDotIndexPath = indexPath
        }
       
        if lastDotIndexPath != nil {
            let lastDot = collectionView.cellForItemAtIndexPath(lastDotIndexPath) as! Dot
            lastDot.removeGlow()
        }
        
        if let dot = collectionView.cellForItemAtIndexPath(indexPath) as? Dot {
            dot.glow()
        }
        
        if let parentController = self.parentViewController as? MSHomeController {
            
            let currentIndex = parentController.currentControllerIndex
            let destinationIndex = indexPath.row
            
            if (destinationIndex < parentController.modelController.pageControllers.count) {
                
                let nextViewController = parentController.modelController.viewControllerAtIndex(destinationIndex)!
                
                if (currentIndex < destinationIndex) {
                    parentController.pageViewController.setViewControllers( [nextViewController], direction: .Forward, animated: true, completion: {done in})
                } else if (currentIndex > destinationIndex) {
                    parentController.pageViewController.setViewControllers( [nextViewController], direction: .Reverse, animated: true, completion: {done in})
                }
                
                parentController.pageViewController(parentController.pageViewController, willTransitionToViewControllers: [nextViewController])
                
            }
        }
        

    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: cellSize, height: cellSize)
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NUM_DOTS
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let dot = collectionView.dequeueReusableCellWithReuseIdentifier(cell_identifier, forIndexPath: indexPath) as! Dot

        return dot
        
    }
    
    
    // Center Cells in collection view
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        let cellPadding = collectionView.layoutMargins.left
        let leftInset = (GC.SCREEN_WIDTH - ((cellSize + cellPadding) * CGFloat(NUM_DOTS) )) / 2
        
        return UIEdgeInsetsMake(0, leftInset, 0, 0);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



/*

Change dot size when clicked?
Add a Label?
Change dot on swipe
*/

class Dot : UICollectionViewCell {
    
    // Change Radius depending on screen Width?
    // An IPad could use bigger dots
    static let RADIUS : CGFloat = 50.0
    
    static var createdDots = 0
    
    static var DEFAULT_SHADOW_COLOR : CGColor!
    static var DEFAULT_SHADOW_RADIUS : CGFloat!
    static var DEFAULT_SHADOW_OFFSET : CGSize!
    static var DEFAULT_OPACITY : Float!
    static var DEFAULT_BG_COLOR = GC.Color.red

    static let initials = [
        "MS", "WF", "TR", "KK", "JF", "QR"
    ]
    
    override init(frame: CGRect) {
        
        defer { Dot.createdDots++ }
        
        super.init(frame: frame)
        setDefaultProperties()
        setDotInitals()
        
    }
    
    private func setDefaultProperties() {
        
        self.backgroundColor = Dot.DEFAULT_BG_COLOR
        self.layer.cornerRadius = Dot.RADIUS / 2
        self.alpha = 0.7
        
        Dot.DEFAULT_SHADOW_COLOR  = self.layer.shadowColor
        Dot.DEFAULT_SHADOW_RADIUS = self.layer.shadowRadius
        Dot.DEFAULT_SHADOW_OFFSET = self.layer.shadowOffset
        Dot.DEFAULT_OPACITY       = self.layer.shadowOpacity
        
    }
    
    private func setDotInitals () {
        
        let initialLabelText = Dot.initials[Dot.createdDots]
        let initialLabel = UILabel(frame: CGRect(x: 0, y: 0, width: Dot.RADIUS, height: Dot.RADIUS))
        
        initialLabel.text = initialLabelText
        initialLabel.textColor = GC.Color.white
        initialLabel.textAlignment = .Center
        initialLabel.font = GC.Font.myraidpro_bold_18
        
        self.backgroundView = initialLabel
        
    }
    
    func glow( ) -> Void {
        
        self.layer.shadowColor = GC.Color.gold.CGColor
        self.layer.shadowRadius = 15;
        self.layer.shadowOffset = CGSizeZero;
        self.layer.shadowOpacity = 4.0;
        self.backgroundColor = GC.Color.gold

    }
    
    func removeGlow() -> Void {
        
        self.layer.shadowColor   = Dot.DEFAULT_SHADOW_COLOR
        self.layer.shadowRadius  = Dot.DEFAULT_SHADOW_RADIUS;
        self.layer.shadowOffset  = Dot.DEFAULT_SHADOW_OFFSET;
        self.layer.shadowOpacity = Dot.DEFAULT_OPACITY;
        self.backgroundColor     = Dot.DEFAULT_BG_COLOR
    }
   

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




