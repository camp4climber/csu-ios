//
//  WebVC.h
//  ClimbingFeed
//
//  Created by Tim Whitaker on 5/9/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"

@interface WebVC : UIViewController

@property (strong, nonatomic) Entry *entry;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
