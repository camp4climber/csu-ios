//
//  WebVC.m
//  ClimbingFeed
//
//  Created by Tim Whitaker on 5/9/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "WebVC.h"
#import "NetworkActivityHelper.h"

@interface WebVC () <UIWebViewDelegate>

@end

@implementation WebVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.entry.title;
    
    dispatch_queue_t t = dispatch_queue_create("Web Request", NULL);
    
    dispatch_async(t, ^{
        [[NetworkActivityHelper sharedInstance] showActivityIndicator];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:self.entry.url];
        self.webView.scalesPageToFit = YES;
        [self.webView loadRequest:request];
        [[NetworkActivityHelper sharedInstance] hideActivityIndicator];
    });
        
}

@end
