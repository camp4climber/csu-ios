//
//  LifeCycleEventList.m
//  LifeCycle
//
//  Created by Tim Whitaker on 2/14/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "LifeCycleEvent.h"
#import "LifeCycleEventList.h"

@interface LifeCycleEventList()
@property (nonatomic, strong) NSMutableArray *eventArray;
@end

@implementation LifeCycleEventList

- (NSMutableArray *) eventArray
{
    if (!_eventArray) _eventArray = [[NSMutableArray alloc] init];
    return _eventArray;
}

- (void) addEventWithName:(NSString *)name
{
    LifeCycleEvent *event = [[LifeCycleEvent alloc] initWithName:name];
    [self.eventArray addObject:event];
}

- (void) clearEvents
{
    [self.eventArray removeAllObjects];
}

- (NSArray *) allEvents
{
    return [self.eventArray copy];
}

@end
