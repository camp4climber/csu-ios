//
//  LifeCycleEvent.m
//  LifeCycle
//
//  Created by Tim Whitaker on 2/14/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "LifeCycleEvent.h"

@implementation LifeCycleEvent

- (id) init
{
    return [self initWithName:@"null"];
}

- (id) initWithName:(NSString*) name
{
    self = [super init];
    if (self)
    {
        _name = name;
        _date = [NSDate date];
    }
    return self;
}

@end
