//
//  TwitterController.m
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-24.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

// This helps when dealing with blocks: http://fuckingblocksyntax.com/

#import <CloudKit/CloudKit.h>
#import "TwitterController.h"
#import "MansbridgeSummit-Swift.h"
#import "Connection.h"

#define COLLECTION_ID @"625072681285758976"

@implementation TwitterController {
    
    Reachability *connection;
    BOOL networkStatusCalled;
    
}

// Generates the getter and setter for this instance variable
@synthesize networkErrorView;

- (void) viewDidLoad {
    
    [super viewDidLoad];

    self->connection = [Reachability reachabilityWithHostName: @"www.mta.ca"];
    self->networkStatusCalled = NO;
    self.networkErrorView = NULL;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(_networkStatusDidChange)
                                                 name:kReachabilityChangedNotification
                                               object:NULL];
    [connection startNotifier];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(44, 0, 0, 0);
    self.tableView.contentInset = insets;
    self.tableView.scrollIndicatorInsets = insets;
    
}

-(void) viewDidAppear:(BOOL)animated {
   
    if ([Connection isNetworkAvailable]) {
        [self removeNetworkConnectionErrorView];
        [self loadTweets];
    } else {
        [self displayNetworkConnectionErrorView];
    }
    
}


- (void) _networkStatusDidChange {
    
    if (!self->networkStatusCalled) {
        
        NSLog(@"----------------- _networkStatusDidChange ----------------------\n");
        self->networkStatusCalled = YES;
        
        // Creates a timer which will call networkStatusDidChange in 1/2s.
        // This is done to avoid a false network status connection
        [NSTimer scheduledTimerWithTimeInterval:0.5
                                         target:self
                                       selector:@selector(networkStatusDidChange)
                                       userInfo:NULL
                                        repeats:NO];
    }
    
}

- (void) networkStatusDidChange {
    
    NSLog(@"----------------- [Connection isNetworkAvailable] ----------%d-------\n", [Connection isNetworkAvailable]);
    networkStatusCalled = NO;
    
    if ([Connection isNetworkAvailable]) {
        [self removeNetworkConnectionErrorView];
        [self loadTweets];
    } else {
        [self displayNetworkConnectionErrorView];
    }
    
}

- (void) loadTweets {
    
    // TwitterKit is defined as [Twitter sharedInstance]
    [TwitterKit logInGuestWithCompletion: ^ (TWTRGuestSession *guestSession, NSError *error) {
        
        if (guestSession != NULL) {

            TWTRCollectionTimelineDataSource *dataSource = [[TWTRCollectionTimelineDataSource alloc]
                                                            initWithCollectionID: COLLECTION_ID
                                                            APIClient: [TwitterKit APIClient] ];
            [self setDataSource: dataSource];
            
        } else {
            NSLog(@"%@", [error localizedDescription]);
        }
        
    }];

}

- (IBAction)composeTweet:(id)sender {
    
    SEL closure =  @selector(postTweet:);
    [self getDefaultStatusAndExecFunc: closure];
}

- (void) postTweet: (NSString*) defaultStatus {

    TWTRComposer *composer = [[TWTRComposer alloc] init];
    [composer setText: defaultStatus];
    [composer showFromViewController: self completion: ^ (TWTRComposerResult result) {
        
        // closure code
        
    }];
    
}

/*
 *
 * Talking with Micah we agreed that CloudKits Key-Value solution was much
 * more appropriate than pulling out all the records from the DB and simply
 * grabbing the first one.
 *
 */
- (void) getDefaultStatusAndExecFunc: (SEL) closure { // :(void (^)(NSString *))closure
    
    // Currently Matches all values in the
    NSPredicate *queryPredicate = [NSPredicate predicateWithValue: YES];
    
    CKDatabase *publicDB = [[CKContainer defaultContainer] publicCloudDatabase];
    CKQuery *query = [[CKQuery alloc] initWithRecordType: @"MansbridgeData" predicate:queryPredicate];
    
    // Query the DB for records (read comment above)
    [publicDB performQuery: query inZoneWithID:nil completionHandler:
     ^(NSArray <CKRecord *> *_Nullable records, NSError * _Nullable error) {
        
         if (error == NULL && records != NULL) {
             
             CKRecord *record = [records objectAtIndex: 0];
             if (record != NULL) {
                 NSString *defaultStatus = [record valueForKey: @"Value"];
                 
                 dispatch_async(dispatch_get_main_queue(), ^ (void){
                     [self performSelector:closure withObject:defaultStatus];
                 });
                
             }
             
         } else {
             
             NSLog(@"%@", [error description]);
             [self performSelector:closure withObject: @"#MansbridgeSummit"];
             
         }
    }];
    
}

- (void)displayNetworkConnectionErrorView {
    
//    if ( [self tableView] != NULL ) {
//        [self.tableView removeFromSuperview];
//    }
    
    if (self.networkErrorView == NULL) {
        UIView * __networkErrorView = [UIView loadFromNibNamed:@"NetworkErrorXIB" bundle: [NSBundle mainBundle] ];
        if ( __networkErrorView != NULL) {
            
            [[self tableView] setSeparatorStyle: UITableViewCellSeparatorStyleNone];
            self.networkErrorView = __networkErrorView;
            self.networkErrorView.frame = [self.view frame];
            [self.view addSubview: __networkErrorView];
            
        }
    }
    
}

- (void)removeNetworkConnectionErrorView {

    if ([self networkErrorView] != NULL) {
        [[self networkErrorView] removeFromSuperview];
    }
    
}

@end


