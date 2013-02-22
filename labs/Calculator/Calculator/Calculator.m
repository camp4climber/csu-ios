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

- (NSNumber *) performOperation
{
    if (self.operation == @"+")
    {
        self.currentNumber = [self add:self.currentNumber with:self.number2];
    }
    else if (self.operation == @"-")
    {
        self.currentNumber = [self subtract:self.currentNumber from:self.number2];
    }
    else if (self.operation == @"*")
    {
        self.currentNumber = [self multiply:self.currentNumber with:self.number2];
    }
    else if (self.operation == @"/")
    {
        self.currentNumber = [self divide:self.currentNumber by:self.number2];
    }
    else if (self.operation == @"^")
    {
        self.currentNumber = [self raise:self.currentNumber toPower:self.number2];
    }
    return self.currentNumber;
}

- (NSNumber *) trigFunction:(NSString *)function withNumber:(NSNumber *)number
{
    if ([function isEqual:@"sin"])
    {
        return @(sin([number doubleValue]));
    }
    else if ([function isEqual:@"cos"])
    {
        return @(cos([number doubleValue]));
    }
    else if ([function isEqual:@"tan"])
    {
        return @(tan([number doubleValue]));
    }
    else if ([function isEqual:@"sec"])
    {
        return @(1/sin([number doubleValue]));
    }
    else if ([function isEqual:@"csc"])
    {
        return @(1/cos([number doubleValue]));
    }
    else if ([function isEqual:@"cot"])
    {
        return @(1/tan([number doubleValue]));
    }
    else
    {
        return @0;
    }
}

- (NSNumber *) unaryFunction:(NSString *)function withNumber:(NSNumber *)number
{
    if ([function isEqual:@"pi"])
    {
        return [self multiply:number with:@M_PI];
    }
    else if ([function isEqual:@"e"])
    {
        return [self multiply:number with:@M_E];
    }
    else if ([function isEqual:@"sqrt"])
    {
        return @(sqrt([number doubleValue]));
    }
    else if ([function isEqual:@"plusminus"])
    {
        if ([number doubleValue] == 0.0)
            return @0;
        return @(-[number doubleValue]);
    }
    else if ([function isEqual:@"log"])
    {
        return @(log10([number doubleValue]));
    }
    else if ([function isEqual:@"ln"])
    {
        return @(log([number doubleValue]));
    }
    else if ([function isEqual:@"reciprocal"])
    {
        return @(1/[number doubleValue]);
    }

    
    return @0;
}

@end
