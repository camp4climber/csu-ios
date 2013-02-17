//
//  Counter.m
//  TheCounter
//
//  Created by Tim Whitaker on 2/7/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "Counter.h"

@implementation Counter

- (id) init
{
    return [self initWithInitialCount:0];
}

- (id) initWithInitialCount:(NSInteger)initialCount
{
    self = [super init];
    if (self)
    {
        self.currentCount = initialCount;
    }
    return self;
}

- (void) increment
{
    self.currentCount++;
}

- (void) decrement
{
    self.currentCount--;
}

@end
