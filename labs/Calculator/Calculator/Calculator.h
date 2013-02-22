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
@property (nonatomic) NSNumber *number2;
@property (nonatomic) NSNumber *result;
@property (nonatomic) NSNumber *memoryValue;
@property (nonatomic) NSString *operation;
- (NSNumber *) multiply:(NSNumber*)first with:(NSNumber*)second;
- (NSNumber *) add:(NSNumber*)first with:(NSNumber*)second;
- (NSNumber *) subtract:(NSNumber*)first from:(NSNumber*)second;
- (NSNumber *) divide:(NSNumber*)first by:(NSNumber*)second;
- (NSNumber *) raise:(NSNumber*)first toPower:(NSNumber*)second;
- (NSNumber *) trigFunction:(NSString*) function withNumber: (NSNumber*)number;
- (NSNumber *) unaryFunction:(NSString *)function withNumber:(NSNumber *)number;
- (NSNumber *) performOperation;

@end
