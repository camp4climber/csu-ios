//
//  LifeCycleEvent.h
//  LifeCycle
//
//  Created by Tim Whitaker on 2/14/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LifeCycleEvent : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSDate *date;

- (id) initWithName:(NSString*) name;

@end
