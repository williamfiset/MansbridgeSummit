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
    
    let cellID = "cellID"
    let cellSize : CGFloat = 50.0
    let NUM_CELLS = 5
    
    let frame = CGRect(x: 0, y: GC.SCREEN_HEIGHT - 150, width: GC.SCREEN_WIDTH, height: 150)
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        
        super.init(collectionViewLayout: layout)
        collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        setCollectionViewProperties()
        
    }

    private func setCollectionViewProperties() {

        collectionView!.registerClass(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: cellID)
        
        collectionView!.bounds = self.frame
        collectionView!.contentSize = CGSize(width: self.frame.width, height: self.frame.height)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.backgroundColor = UIColor.clearColor()
        collectionView!.backgroundView = UIView(frame: CGRectZero)
        collectionView!.frame = self.frame
        
        // DEBUGGIN
        let bg = UIView(frame: frame)
        bg.backgroundColor = UIColor.redColor()
        collectionView!.backgroundColor = UIColor.redColor()
        collectionView!.backgroundView = bg
        
    }
    
    // Detect click events on the items in the collection
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        print(indexPath.section, indexPath.row)
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: cellSize, height: cellSize)
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NUM_CELLS
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath)
        cell.backgroundColor = UIColor.greenColor()
        return cell
        
    }
    
    
    // Center Cells in collection view
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        let cellPadding = collectionView.layoutMargins.left
        let leftInset = (GC.SCREEN_WIDTH - ((cellSize + cellPadding) * CGFloat(NUM_CELLS) )) / 2
        
        return UIEdgeInsetsMake(0, leftInset, 0, 0);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


