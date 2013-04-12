//
//  CMMotionManager+Shared.h
//  Baller
//
//  Created by Chris Morris on 4/11/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>

@interface CMMotionManager (Shared)

+ (CMMotionManager *)sharedMotionManager;

@end
