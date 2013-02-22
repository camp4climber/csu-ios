//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Tim Whitaker on 2/14/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "Calculator.h"
#import "CalculatorViewController.h"
#import "math.h"
#import <QuartzCore/QuartzCore.h>

typedef enum{ Plus,Minus,Multiply,Divide,Raise } Operation;

@interface CalculatorViewController ()
    @property (nonatomic, strong) Calculator *calc;
    @property (nonatomic) Operation op;
    @property (nonatomic) NSNumber *storage;
@end

@implementation CalculatorViewController

- (Calculator *)calc
{
    if (!_calc) _calc = [[Calculator alloc] init];
    return _calc;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.display.layer.borderColor = [UIColor grayColor].CGColor;
    self.display.layer.borderWidth = 1.0;
    self.display.layer.cornerRadius = 5;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)numberPressed:(UIButton *)sender
{
    NSString *text = @"";
    
    switch (sender.tag) {
        case 0:
            text = [self.display.text stringByAppendingString:@"0"];
            break;
        case 1:
            text = [self.display.text stringByAppendingString:@"1"];
            break;
        case 2:
            text = [self.display.text stringByAppendingString:@"2"];
            break;
        case 3:
            text = [self.display.text stringByAppendingString:@"3"];
            break;
        case 4:
            text = [self.display.text stringByAppendingString:@"4"];
            break;
        case 5:
            text = [self.display.text stringByAppendingString:@"5"];
            break;
        case 6:
            text = [self.display.text stringByAppendingString:@"6"];
            break;
        case 7:
            text = [self.display.text stringByAppendingString:@"7"];
            break;
        case 8:
            text = [self.display.text stringByAppendingString:@"8"];
            break;
        case 9:
            text = [self.display.text stringByAppendingString:@"9"];
            break;
        default:
            break;
    }
    
    [self updateUI:text];
}

- (IBAction)operationPressed:(UIButton *)sender
{
    NSString *text = @"0";
    self.calc.currentNumber = @([self.display.text doubleValue]);
    
    switch (sender.tag) {
        //multiply current number by pi
        case 10:
            self.calc.result = [self.calc multiply:self.calc.currentNumber with:@M_PI];
            self.calc.currentNumber = self.calc.result;
            text = [self.calc.result description];
            break;
        //multiply current number by e
        case 11:
            self.calc.result = [self.calc multiply:self.calc.currentNumber with:@M_E];
            self.calc.currentNumber = self.calc.result;
            text = [self.calc.result description];
            break;
        //clear
        case 12:
            self.calc.currentNumber = @0;
            self.calc.result = @0;
            self.storage = @0;
            text = @"";
        //sine
        case 13:
            self.calc.result = @(sin([self.calc.currentNumber doubleValue]));
            self.calc.currentNumber = self.calc.result;
            text = [self.calc.result description];
            self.calc.result = @0;
            break;
        //cosine
        case 14:
            self.calc.result = @(cos([self.calc.currentNumber doubleValue]));
            self.calc.currentNumber = self.calc.result;
            text = [self.calc.result description];
            self.calc.result = @0;
            break;
        //tangent
        case 15:
            self.calc.result = @(tan([self.calc.currentNumber doubleValue]));
            self.calc.currentNumber = self.calc.result;
            text = [self.calc.result description];
            self.calc.result = @0;
            break;
        //secant
        case 16:
            self.calc.result = @(1/sin([self.calc.currentNumber doubleValue]));
            self.calc.currentNumber = self.calc.result;
            text = [self.calc.result description];
            self.calc.result = @0;
            break;
        //cosecant
        case 17:
            self.calc.result = @(1/cos([self.calc.currentNumber doubleValue]));
            self.calc.currentNumber = self.calc.result;
            text = [self.calc.result description];
            self.calc.result = @0;
            break;
        //cotangent
        case 18:
            self.calc.result = @(1/tan([self.calc.currentNumber doubleValue]));
            self.calc.currentNumber = self.calc.result;
            text = [self.calc.result description];
            self.calc.result = @0;
            break;
        //memory store
        case 19:
            self.calc.memoryValue = self.calc.currentNumber;
            text = [self.calc.currentNumber description];
            break;
        //memory recall
        case 20:
            self.calc.currentNumber = self.calc.memoryValue;
            text = [self.calc.currentNumber description];
            break;
        //memory clear
        case 21:
            self.calc.memoryValue = @0;
            text = [self.calc.currentNumber description];
            break;
        //add
        case 22:
            self.op = Plus;
            self.storage = [self.calc add:self.calc.currentNumber with:self.calc.result];
            self.calc.result = self.storage;
            self.calc.currentNumber = @0;
            text = @"";
            break;
        //subtract
        case 23:
            self.op = Minus;
            if(self.calc.result==0)
            {
                self.storage = [self.calc subtract:self.calc.result from:self.calc.currentNumber];
            }
            else
            {
                self.storage = [self.calc subtract:self.calc.currentNumber from:self.calc.result];
            }
            self.calc.result = self.storage;
            self.calc.currentNumber = @0;
            text = @"";
            break;
        //multiply
        case 24:
            self.op = Multiply;
            if (self.calc.result != 0)
            {
                self.storage = [self.calc multiply:self.calc.currentNumber with:self.calc.result];
            }
            else
            {
                self.storage = self.calc.currentNumber;
            }
            self.calc.result = self.storage;
            text = @"";
            break;
        //divide
        case 25:
            self.op = Divide;
            if (self.calc.result != 0)
            {
                self.storage = [self.calc divide:self.calc.currentNumber by:self.calc.result];
            }
            self.calc.result = self.storage;
            text = @"";
            break;
        //square root
        case 26:
            self.calc.currentNumber = @(sqrt([self.calc.currentNumber doubleValue]));
            text = [self.calc.currentNumber description];
            break;
        //exponent
        case 27:
            self.op = Raise;
            if (self.calc.result == @0)
            {
                self.storage = self.calc.currentNumber;
            }
            else
            {
                self.storage = [self.calc raise:self.calc.currentNumber toPower:self.calc.result];
            }
            self.calc.result = self.storage;
            text = @"";
            break;
        //equals
        case 28:
            switch (self.op) {
                case Plus:
                    self.calc.result = [self.calc add:self.calc.currentNumber with:self.storage];
                    text = [self.calc.result description];
                    break;
                case Minus:
                    self.calc.result = [self.calc subtract:self.calc.currentNumber from:self.storage];
                    text = [self.calc.result description];
                    break;
                case Multiply:
                    self.calc.result = [self.calc multiply:self.calc.currentNumber with:self.storage];
                    text = [self.calc.result description];
                    break;
                case Divide:
                    self.calc.result = [self.calc divide:self.calc.currentNumber by:self.storage];
                    text = [self.calc.result description];
                    break;
                case Raise:
                    self.calc.result = [self.calc raise:self.storage toPower:self.calc.currentNumber];
                    text = [self.calc.result description];
                    break;
                default:
                    break;
            }
            break;
        //plusminus
        case 29:
            self.calc.currentNumber = @(-([self.calc.currentNumber doubleValue]));
            text = [self.calc.currentNumber description];
            break;
        //decimal
        case 30:
            if ([self.display.text rangeOfString:@"."].length > 0) {
                break;
            }
            text = [self.display.text stringByAppendingString:@"."];
            break;
        //LOG
        case 31:
            self.calc.result = @(log10([self.calc.currentNumber doubleValue]));
            self.calc.currentNumber = self.calc.result;
            text = [self.calc.result description];
            self.calc.result = @0;
            break;
        //LN
        case 32:
            self.calc.result = @(log([self.calc.currentNumber doubleValue]));
            self.calc.currentNumber = self.calc.result;
            text = [self.calc.result description];
            self.calc.result = @0;
            break;
        //reciprocal
        case 33:
            self.calc.result = @(1/[self.calc.currentNumber doubleValue]);
            self.calc.currentNumber = self.calc.result;
            text = [self.calc.result description];
            self.calc.result = @0;
            break;
        default:
            break;
    }
    [self updateUI:text];
}


- (void) updateUI:(NSString *)text
{
    self.display.text = text;
}

@end
