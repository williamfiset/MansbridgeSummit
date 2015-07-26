//
//  Connection.h
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-23.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SCNetworkReachability.h>

@interface Connection : NSObject

+ (BOOL) isNetworkAvailable;

@end
