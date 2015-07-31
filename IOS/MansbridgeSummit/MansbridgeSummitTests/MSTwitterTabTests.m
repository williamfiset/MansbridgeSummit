//
//  MSTwitterTabTests.m
//  MansbridgeSummit
//
//  Created by William Fiset on 2015-07-30.
//  Copyright © 2015 Mansbridge Summit Dev Team. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TwitterController.h"

// Have never been able to run these tests due to Internal inconsistancy error

/*
@interface MSTwitterTabTests : XCTestCase

@end

@implementation MSTwitterTabTests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCreatingTwitterController {
    
    TwitterController *twitterController = [[TwitterController alloc] init];
    [twitterController viewDidLoad];
    
}

- (void) testLoadingTweets {

    TwitterController *twitterController = [[TwitterController alloc] init];
    
    [twitterController loadTweets];
    
    // NSTimer.scheduledTimerWithTimeInterval
    [NSTimer scheduledTimerWithTimeInterval:3.0
                                     target: self
                                     selector: @selector(validateGettingTweets:)
                                     userInfo:nil
                                     repeats:NO ];
    
}

- (void) validateGettingTweets: (TwitterController*) controller {
    
    UITableView *table = [controller tableView];
    int rows = (int) [table numberOfRowsInSection:0];
    
    XCTAssertGreaterThan( (int) rows, 0);
    
}

@end

*/











