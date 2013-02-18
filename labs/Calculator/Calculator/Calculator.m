//
//  Calculator.m
//  Calculator
//
//  Created by Tim Whitaker on 2/17/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

- (NSNumber *) multiply:(NSNumber *)first with:(NSNumber *)second
{
    return @([first doubleValue]*[second doubleValue]);
}

@end
