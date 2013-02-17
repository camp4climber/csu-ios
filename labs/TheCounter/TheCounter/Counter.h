//
//  Counter.h
//  TheCounter
//
//  Created by Tim Whitaker on 2/7/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Counter : NSObject

@property (nonatomic) NSInteger currentCount;

- (id) initWithInitialCount:(NSInteger)initialCount;
- (void) increment;
- (void) decrement;

@end
