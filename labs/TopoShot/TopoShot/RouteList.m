//
//  RouteList.m
//  TopoShot
//
//  Created by Tim Whitaker on 3/30/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "RouteList.h"

@interface RouteList ()

@property (nonatomic, strong) NSMutableSet *set;

@end

@implementation RouteList

- (NSMutableSet *) set
{
    if (!_set)
    {
        _set = [[NSMutableSet alloc] init];
    }
    return _set;
}

- (void) addRoute:(Route *)route
{
    [self.set addObject:route];
}

- (void) removeRoute:(Route *)route
{
    [self.set removeObject:route];
}

- (NSArray *) allRoutes
{
    return [self.set allObjects];
}

+ (RouteList *) sharedRouteList
{
    static RouteList *sharedRouteList;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedRouteList = [[RouteList alloc] init];
    });
    return sharedRouteList;
}

@end
