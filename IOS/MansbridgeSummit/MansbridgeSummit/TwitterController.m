//
//  TwitterController.m
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-24.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

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
    
}

-(void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
     UIBarButtonItem *composeButton = [[UIBarButtonItem alloc]
                                    initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(composeTweetHelper)];
    
    self.navigationItem.rightBarButtonItem = composeButton;
    
    // Move the content below the navigation bar
    UIEdgeInsets insets = UIEdgeInsetsMake(44, 0, 0, 0);
    self.tableView.contentInset = insets;
    self.tableView.scrollIndicatorInsets = insets;
    
}

-(void) viewDidAppear:(BOOL)animated {
   
    [super viewDidAppear:animated];
    
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
    
    [self composeTweetHelper];
    
}

- (void) composeTweetHelper {
    
    TWTRComposer *composer = [[TWTRComposer alloc] init];
    [composer setText: @"#MansbridgeSummit"];
    [composer showFromViewController: self completion: ^ (TWTRComposerResult result) {
        
        // closure code
        
    }];
    
}

- (void)displayNetworkConnectionErrorView {
    
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