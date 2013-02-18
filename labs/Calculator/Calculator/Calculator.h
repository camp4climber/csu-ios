//
//  Calculator.h
//  Calculator
//
//  Created by Tim Whitaker on 2/17/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property (nonatomic) NSNumber *currentNumber;
@property (nonatomic) NSNumber *result;
- (NSNumber *) multiply:(NSNumber*)first with:(NSNumber*)second;

@end
