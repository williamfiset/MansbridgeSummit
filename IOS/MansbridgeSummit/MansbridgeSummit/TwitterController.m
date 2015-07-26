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
                                                            initWithCollectionID: @"625072681285758976"
                                                            APIClient: [TwitterKit APIClient] ];
            [self setDataSource: dataSource];
            
        } else {
            // NSLog(@"%@", [error localizedDescription]);
        }
        
    }];

}


- (void) postTweets {
    
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


