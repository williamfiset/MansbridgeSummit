//
//  MGTwitterEngine+TH.h
//  TwitHunter
//
//  Created by Nicolas Seriot on 5/1/10.
//  Copyright 2010 seriot.ch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STTwitterProtocol.h"

extern NS_ENUM(NSUInteger, STTwitterOSErrorCode) {
    STTwitterOSSystemCannotAccessTwitter = 0,
    STTwitterOSCannotFindTwitterAccount,
    STTwitterOSUserDeniedAccessToTheirAccounts,
    STTwitterOSNoTwitterAccountIsAvailable
};

@class ACAccount;

@interface STTwitterOS : NSObject <STTwitterProtocol, NSURLConnectionDelegate> {
    
}

+ (instancetype)twitterAPIOSWithAccount:(ACAccount *)account;
+ (instancetype)twitterAPIOSWithFirstAccount;

- (BOOL)canVerifyCredentials;
- (void)verifyCredentialsWithSuccessBlock:(void(^)(NSString *username))successBlock errorBlock:(void(^)(NSError *error))errorBlock;

- (NSString *)username;

@end
