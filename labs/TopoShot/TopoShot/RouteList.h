//
//  RouteList.h
//  TopoShot
//
//  Created by Tim Whitaker on 3/30/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Route.h"

@interface RouteList : NSObject

- (void)addRoute:(Route *)route;
- (void)removeRoute:(Route *)route;
- (NSArray *) allRoutes;

+ (RouteList *) sharedRouteList;

@end
