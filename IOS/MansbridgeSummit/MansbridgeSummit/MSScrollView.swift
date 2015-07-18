//
//  MSScrollView.swift
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-12.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

import Foundation
import UIKit

public class MSScrollView : UIScrollView {

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = GC.Color.white
        self.showsVerticalScrollIndicator = true
        self.scrollEnabled = true;
        self.userInteractionEnabled = true;
        self.indicatorStyle = UIScrollViewIndicatorStyle.Black
        self.contentSize = CGSize(width: frame.width, height: frame.height*3)
        
        addLabels()
    }

    public func addLabels() -> Void {
        
        let label1 = UILabel(frame: CGRect(x: 0, y: 400, width: 300, height: 78))
        let label2 = UILabel(frame: CGRect(x: 0, y: 900, width: 300, height: 78))
        
        label1.text = "Hello"
        label2.text = "World"
        
        addSubview(label1)
        addSubview(label2)
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
