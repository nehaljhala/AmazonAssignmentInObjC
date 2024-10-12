//
//  AssignmentAmazonAppInObjCTests.m
//  AssignmentAmazonAppInObjCTests
//
//  Created by Nehal Jhala on 10/9/24.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface ViewControllerTests : XCTestCase

@property (nonatomic, strong) ViewController *viewController;

@end

@implementation ViewControllerTests

- (void)setUp {
    [super setUp];
    self.viewController = [[ViewController alloc] init];
}

- (void)tearDown {
    self.viewController = nil;
    [super tearDown];
}

// Test to verify the web view's URL
- (void)testLoadWebView {
    NSURL *expectedURL = [NSURL URLWithString:@"https://www.amazon.com"];
    XCTAssertEqualObjects(self.viewController.homeURL, expectedURL, @"The url is the same");
    XCTAssertNotNil(self.viewController.homeURL, @"The url should not be nil");
}

- (void)testHomeURL {
    NSURL *expectedURL = [NSURL URLWithString:@"https://www.amazon.com"];
    XCTAssertEqualObjects(self.viewController.homeURL, expectedURL, @"The home URL should be the same.");
}

// Test to verify the cart URL
- (void)testCartURL {
    NSURL *expectedCartURL = [NSURL URLWithString:@"https://www.amazon.com/cart"];
    XCTAssertEqualObjects(self.viewController.cartURL, expectedCartURL, @"The cart URL should be the same.");
}

// Test to verify link titles count
- (void)testLinkTitlesCount {
    XCTAssertEqual(self.viewController.linkTitles.count, 7, @"There should be 7 link titles.");
}
@end
