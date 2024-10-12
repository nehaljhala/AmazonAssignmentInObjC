//
//  WebViewController.h
//  AssignmentAmazonAppInObjC
//
//  Created by Nehal Jhala on 10/9/24.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebViewController : UIViewController <WKUIDelegate>

@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *done;
@property (strong, nonatomic) NSString *urlString;
@property (strong, nonatomic) NSString *identifier;


@end

NS_ASSUME_NONNULL_END
