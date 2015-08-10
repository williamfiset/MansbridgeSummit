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
#import "Reachability.h"

@interface TwitterController : TWTRTimelineViewController < NetworkFailureRecovery > {
    
}

@property (nonatomic, retain) UIView *networkErrorView;

- (void) loadTweets;
- (IBAction) composeTweet:(id)sender;

// Need to be declared public for accessiblity with selector?
- (void) _networkStatusDidChange;
- (void) networkStatusDidChange;

@end