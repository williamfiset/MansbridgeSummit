//
//  TwitterController.h
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-24.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <TwitterKit/TwitterKit.h>
#import <UIKit/UIKit.h>
#import "MansbridgeSummit-Swift.h"

@interface TwitterController : TWTRTimelineViewController < NetworkFailureRecovery > {
    
}
@property (nonatomic, assign) UIView *networkErrorView;

@end