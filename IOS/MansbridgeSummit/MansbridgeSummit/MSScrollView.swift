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
        self.contentSize = CGSize(width: frame.width, height: frame.height * 3)
        
        addComponents()
        
    }

    
    public func addComponents() -> Void {
        
        let imageWidth = CGFloat(self.frame.size.width / 4)
        let yBaseline = self.frame.size.height
        var xPos = CGFloat(0)
        
        let speaker1Image = UIImage(named: "Speaker1")
        let speaker1ImageView = getImageViewAspectFit(speaker1Image!, x: xPos, yBaseline: yBaseline, width: imageWidth)
        addSubview(speaker1ImageView)
        
        xPos += imageWidth
        
        let speaker2Image = UIImage(named: "Speaker2")
        let speaker2ImageView = getImageViewAspectFit(speaker2Image!, x: xPos, yBaseline: yBaseline, width: imageWidth)
        addSubview(speaker2ImageView)

        xPos += imageWidth
        
        let speaker3Image = UIImage(named: "Speaker3")
        let speaker3ImageView = getImageViewAspectFit(speaker3Image!, x: xPos, yBaseline: yBaseline, width: imageWidth)
        addSubview(speaker3ImageView)
        
        xPos += imageWidth
        
        let speaker4Image = UIImage(named: "Speaker4")
        let speaker4ImageView = getImageViewAspectFit(speaker4Image!, x: xPos, yBaseline: yBaseline, width: imageWidth)
        addSubview(speaker4ImageView)

    }
    
    private func getImageViewAspectFit(image: UIImage, x: CGFloat, yBaseline: CGFloat, width: CGFloat) -> UIImageView {
    
        let ratio = image.size.width / image.size.height
        let newHeight = CGFloat(width) / ratio
    
        let imageView = UIImageView(image: image)
        
        imageView.frame = CGRect(x: x, y: yBaseline - newHeight, width: width, height: newHeight)
        
        return imageView
    
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
