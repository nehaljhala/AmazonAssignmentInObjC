//
//  ViewController.h
//  AssignmentAmazonAppInObjC
//
//  Created by Nehal Jhala on 10/9/24.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface ViewController : UIViewController <UISearchBarDelegate, UIScrollViewDelegate, UIWebViewDelegate, WKUIDelegate , UITabBarDelegate, WKNavigationDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIScrollView *horizontalScrollView;
@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (weak, nonatomic) IBOutlet UITabBar *tabBar;
@property (strong, nonatomic) UITabBarItem *homeTabBarItem;
@property (strong, nonatomic) UITabBarItem *cartTabBarItem;
@property (strong, nonatomic) UIStackView *stackView;
@property (strong, nonatomic) NSArray *linkTitles;

- (const NSURL *)homeURL;
- (const NSURL *)cartURL;

- (void)viewDidLoad;
- (void)viewDidLayoutSubviews;
- (void)setUpScrollView;
- (void)configureStackViewWithLinks;
- (void)loadWebView;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
- (void)configureTabbar;
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item;
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;
- (IBAction)buttonAction:(UIButton *)button;
- (IBAction)dismissKeyboard;

@end



