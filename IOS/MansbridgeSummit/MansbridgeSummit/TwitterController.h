//
//  TwitterController.h
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-24.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

#import "MansbridgeSummit-Swift.h"
#import <Foundation/Foundation.h>
#import <TwitterKit/TwitterKit.h>
#import <UIKit/UIKit.h>


@interface TwitterController : TWTRTimelineViewController < NetworkFailureRecovery, UINavigationBarDelegate > {
    
}

@property (nonatomic, assign) UIView *networkErrorView;
@property (nonatomic, strong) UINavigationItem *twitterNavigationItem;

- (void) loadTweets;
- (void) postTweets;

- (void) getDefaultStatusAndExecFunc; //:(void (^)(NSString *))closure;


@end