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

@implementation TwitterController

@synthesize networkErrorView = _networkErrorView;

- (void) viewDidLoad {
    
    [super viewDidLoad];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(44, 0, 0, 0);
    self.tableView.contentInset = insets;
    self.tableView.scrollIndicatorInsets = insets;
    
    [self displayNavigationBar];
    
    if ([Connection isNetworkAvailable]) {
        [self loadTweets];
    } else {
        [self displayNetworkConnectionErrorView];
    }
    
}

- (UIBarPosition)positionForBar:(nonnull id<UIBarPositioning>)bar {
    return  UIBarPositionTopAttached;
}

- (void) displayNavigationBar {
    
    // Create the navigation bar
    CGRect frame = CGRectMake(0, -44, self.view.frame.size.width, 44);
    UINavigationBar *navBar = [[UINavigationBar init] initWithFrame:frame style: UITableViewStyleGrouped];
    navBar.backgroundColor = [[UIColor class] whiteColor];
    [navBar setDelegate:self];
    
    // Create a navigation items
    _twitterNavigationItem = [UINavigationItem init];
    _twitterNavigationItem.title = @"Twitter Feed";
    _twitterNavigationItem.rightBarButtonItem = [[UIBarButtonItem init] initWithBarButtonSystemItem: UIBarButtonSystemItemAction target: self action: NSSelectorFromString(@"methodName")];
    
    // Assign the navigation item to the navigation bar
    [navBar setItems: @[ _twitterNavigationItem ]];
    
    // Make the navigation bar a subview of the current view controller
    [[self view] addSubview: navBar];
    
}

- (void) loadTweets {
    
    // TwitterKit is defined as [Twitter sharedInstance]
    [TwitterKit logInGuestWithCompletion: ^ (TWTRGuestSession *guestSession, NSError *error) {
        
        if (guestSession != NULL) {
            
            TWTRCollectionTimelineDataSource *dataSource = [[TWTRCollectionTimelineDataSource init]
                                                            initWithCollectionID: COLLECTION_ID
                                                            APIClient: [TwitterKit APIClient] ];
            [self setDataSource: dataSource];
            
        } else {
            NSLog(@"%@", [error localizedDescription]);
        }
        
    }];

}


- (void) postTweets {
    
    SEL closure =  @selector(postTweetHelper:);
    [self getDefaultStatusAndExecFunc: closure];
    
}

- (void) postTweetHelper: (NSString*) defaultStatus {
    
    TWTRComposer *composer = [TWTRComposer init];
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
    CKQuery *query = [[CKQuery init] initWithRecordType: @"MansbridgeData" predicate:queryPredicate];
    
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
    
    if ( [self tableView] != NULL ) {
        [self.tableView removeFromSuperview];
    }
    
    if (self.networkErrorView != NULL) {
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
    
    if (self.networkErrorView != NULL) {
        [self.networkErrorView removeFromSuperview];
    }
    
}

@end


