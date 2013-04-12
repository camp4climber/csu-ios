//
//  NetworkActivityHelper.m
//  Chart Toppers
//
//  Created by Tim Whitaker on 4/10/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "NetworkActivityHelper.h"

@implementation NetworkActivityHelper

int count = 0;

+ (NetworkActivityHelper *) sharedInstance
{
    static NetworkActivityHelper *sharedInstance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[NetworkActivityHelper alloc] init];
    });
    
    return sharedInstance;
}

- (void) showActivityIndicator
{
    count++;
    if (count > 0)
    {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    }
}

- (void) hideActivityIndicator
{
    count--;
    if (count <= 0)
    {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }
}

@end
