//
//  ViewController.m
//  AssignmentAmazonAppInObjC
//
//  Created by Nehal Jhala on 10/9/24.
//

#import "ViewController.h"
#import "WebViewController.h"

@implementation ViewController

// Constants:
- (const NSURL *)homeURL {
    return [NSURL URLWithString:@"https://www.amazon.com"];
}

- (const NSURL *)cartURL {
    return [NSURL URLWithString:@"https://www.amazon.com/cart"];
}

- (NSArray *)linkTitles {
    return @[@"95037", @"Whole Foods", @"Groceries", @"Pharmacy", @"Alexa", @"Medicine", @"Prime"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    self.tabBar.delegate = self;
    self.horizontalScrollView.delegate = self;
    self.webView.scrollView.delegate = self;
    
    [self.view addSubview:self.horizontalScrollView];
    [self setUpScrollView];
    [self configureStackViewWithLinks];
    [self.view addSubview:self.webView];
    [self configureTabbar];
    [self loadWebView];
    self.tabBar.selectedItem = self.tabBar.items[0];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tapGesture.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGesture];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
}

// configure scroll view:
- (void)setUpScrollView {
    self.horizontalScrollView.backgroundColor = [UIColor clearColor];
    self.horizontalScrollView.showsVerticalScrollIndicator = NO;
    self.horizontalScrollView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint constraintWithItem:self.horizontalScrollView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:50.0].active = YES;
    [NSLayoutConstraint constraintWithItem:self.horizontalScrollView
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.searchBar
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:0.0].active = YES;
    [NSLayoutConstraint constraintWithItem:self.horizontalScrollView
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeading
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.horizontalScrollView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0].active = YES;
}

- (void)configureStackViewWithLinks {
    self.stackView = [[UIStackView alloc] init];
    [self.horizontalScrollView addSubview:self.stackView];
    self.stackView.axis = UILayoutConstraintAxisHorizontal;
    self.stackView.spacing = 20;
    self.stackView.alignment = UIStackViewAlignmentFill;
    self.stackView.distribution = UIStackViewDistributionFillProportionally;
    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint constraintWithItem:self.stackView
                                 attribute:NSLayoutAttributeTrailing
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.horizontalScrollView
                                 attribute:NSLayoutAttributeTrailing
                                multiplier:1.0
                                  constant:10.0].active = YES;
    [NSLayoutConstraint constraintWithItem:self.stackView
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.horizontalScrollView
                                 attribute:NSLayoutAttributeLeading
                                multiplier:1.0
                                  constant:10.0].active = YES;
    [NSLayoutConstraint constraintWithItem:self.stackView
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.horizontalScrollView
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:5.0].active = YES;
    [NSLayoutConstraint constraintWithItem:self.stackView
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.horizontalScrollView
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:5.0].active = YES;
    [NSLayoutConstraint constraintWithItem:self.stackView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.horizontalScrollView
                                 attribute:NSLayoutAttributeHeight
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    for (NSString *title in self.linkTitles) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.backgroundColor = [UIColor whiteColor];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.stackView addArrangedSubview:button];
    }
}


// Method to segue to the next view when link tapped
- (void)buttonAction:(UIButton *)button {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    WebViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"goToWebView"];
    
    if (vc) {
        [self presentViewController:vc animated:YES completion:nil];
    } else {
        NSLog(@"Could not instantiate view controller");
    }
}

// Load the webview with the URL
- (void)loadWebView {
    self.webView.navigationDelegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.homeURL]];
    self.tabBarController.selectedIndex = 0;
}

// ScrollView delegate method for animation
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y > 0) {
        self.tabBar.hidden = YES;
        self.horizontalScrollView.hidden = YES;
    } else {
        self.tabBar.hidden = NO;
        self.horizontalScrollView.hidden = NO;
    }
}

// Tab bar item configuration and delegate method to load different URLs for each tab
- (void)configureTabbar {
    UITabBarItem *homeTab = [[UITabBarItem alloc] initWithTitle:@"Home Tab" image:[UIImage systemImageNamed:@"house"] tag:0];
    UITabBarItem *cartTab = [[UITabBarItem alloc] initWithTitle:@"Cart Tab" image:[UIImage systemImageNamed:@"cart"] tag:1];
    self.tabBar.items = @[homeTab, cartTab];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    switch (item.tag) {
        case 0:
            // Load amazon home URL
            [self.webView loadRequest:[NSURLRequest requestWithURL:self.homeURL]];
            break;
        case 1:
            // Load amazon cart URL
            [self.webView loadRequest:[NSURLRequest requestWithURL:self.cartURL]];
            break;
        default:
            break;
    }
}

// SearchBar delegate method
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *searchText = searchBar.text;
    if (searchText.length > 0) {
        [searchBar resignFirstResponder];
    }
}

// Dismiss keyboard method
- (void)dismissKeyboard {
    self.searchBar.text = @"";
    [self.searchBar resignFirstResponder];
}

@end
