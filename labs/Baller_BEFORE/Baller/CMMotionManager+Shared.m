//
//  CMMotionManager+Shared.m
//  Baller
//
//  Created by Chris Morris on 4/11/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "CMMotionManager+Shared.h"

@implementation CMMotionManager (Shared)

+ (CMMotionManager *)sharedMotionManager
{
    static CMMotionManager *sharedMotionManager = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        sharedMotionManager = [[CMMotionManager alloc] init];
    });

    return sharedMotionManager;
}

@end
