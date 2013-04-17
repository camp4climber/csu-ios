//
//  NetworkActivityHelper.h
//  Chart Toppers
//
//  Created by Tim Whitaker on 4/10/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkActivityHelper : NSObject

+ (NetworkActivityHelper *) sharedInstance;

- (void)showActivityIndicator;
- (void)hideActivityIndicator;

@end
