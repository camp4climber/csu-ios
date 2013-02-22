//
//  Calculator.m
//  Calculator/Users/timwhitaker/school/cins567/labs/Calculator/Calculator/Calculator.m
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

- (NSNumber *) add:(NSNumber *)first with:(NSNumber *)second
{
    return @([first doubleValue]+[second doubleValue]);
}

- (NSNumber *) subtract:(NSNumber *)first from:(NSNumber *)second
{
    return @([second doubleValue]-[first doubleValue]);
}

- (NSNumber *) divide:(NSNumber *)first by:(NSNumber *)second
{
    return @([first doubleValue]/[second doubleValue]);
}

- (NSNumber *) raise:(NSNumber *)first toPower:(NSNumber *)second
{
    return @(pow([first doubleValue], [second doubleValue]));
}

-(NSNumber *) parseEquation
{
    return 0;
}

@end
