//
//  Connection.m
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-23.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

#import "Connection.h"

@implementation Connection

+(BOOL) isNetworkAvailable
{
    SCNetworkReachabilityFlags flags;
    SCNetworkReachabilityRef address;
    address = SCNetworkReachabilityCreateWithName(NULL, "www.mta.com" );
    Boolean success = SCNetworkReachabilityGetFlags(address, &flags);
    CFRelease(address);
    
    bool canReach = success
    && !(flags & kSCNetworkReachabilityFlagsConnectionRequired)
    && (flags & kSCNetworkReachabilityFlagsReachable);
    
    return canReach;
}


@end
