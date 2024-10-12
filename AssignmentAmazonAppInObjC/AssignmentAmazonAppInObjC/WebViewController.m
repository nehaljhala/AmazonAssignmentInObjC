//
//  WebViewController.m
//  AssignmentAmazonAppInObjC
//
//  Created by Nehal Jhala on 10/9/24.
//

#import "WebViewController.h"
#import "ViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.urlString = @"https://www.amazon.com";
    self.identifier = @"goToWebView";
    [self.view addSubview:self.webView];
    [self loadWebView];
}

// Load webview with URL
- (void)loadWebView {
    self.webView.UIDelegate = self;//WKUIDelegate
    NSURL *url = [NSURL URLWithString:self.urlString];
    
    if (url) {
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
    }
}

// Go back to previous controller
- (IBAction)backButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
