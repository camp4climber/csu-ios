//
//  NetworkActivityHelper.h
//  ClimbingFeed
//
//  Created by Tim Whitaker on 5/8/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkActivityHelper : NSObject

+ (NetworkActivityHelper *) sharedInstance;

- (void)showActivityIndicator;
- (void)hideActivityIndicator;

@end
