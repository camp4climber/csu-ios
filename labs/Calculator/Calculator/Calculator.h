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
@property (nonatomic) NSNumber *memoryValue;
@property (nonatomic) NSMutableArray *equation;
- (NSNumber *) multiply:(NSNumber*)first with:(NSNumber*)second;
- (NSNumber *) add:(NSNumber*)first with:(NSNumber*)second;
- (NSNumber *) subtract:(NSNumber*)first from:(NSNumber*)second;
- (NSNumber *) divide:(NSNumber*)first by:(NSNumber*)second;
- (NSNumber *) raise:(NSNumber*)first toPower:(NSNumber*)second;
- (NSNumber *) parseEquation;

@end
