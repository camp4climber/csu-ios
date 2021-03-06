//
//  LifeCycleEventList.h
//  LifeCycle
//
//  Created by Tim Whitaker on 2/14/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LifeCycleEventList : NSObject

- (void) addEventWithName:(NSString *)name;
- (void) clearEvents;
- (NSArray *) allEvents;

@end
