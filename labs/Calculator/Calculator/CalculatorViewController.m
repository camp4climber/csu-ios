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

@interface CalculatorViewController ()
    @property (nonatomic, strong) Calculator *calc;
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
            self.calc.currentNumber = @([self.calc.currentNumber intValue]*10+0);
            text = [self.calc.currentNumber description];
            break;
        case 1:
            self.calc.currentNumber = @([self.calc.currentNumber intValue]*10+1);
            text = [self.calc.currentNumber description];
            break;
        case 2:
            self.calc.currentNumber = @([self.calc.currentNumber intValue]*10+2);
            text = [self.calc.currentNumber description];
            break;
        case 3:
            self.calc.currentNumber = @([self.calc.currentNumber intValue]*10+3);
            text = [self.calc.currentNumber description];
            break;
        case 4:
            self.calc.currentNumber = @([self.calc.currentNumber intValue]*10+4);
            text = [self.calc.currentNumber description];
            break;
        case 5:
            self.calc.currentNumber = @([self.calc.currentNumber intValue]*10+5);
            text = [self.calc.currentNumber description];
            break;
        case 6:
            self.calc.currentNumber = @([self.calc.currentNumber intValue]*10+6);
            text = [self.calc.currentNumber description];
            break;
        case 7:
            self.calc.currentNumber = @([self.calc.currentNumber intValue]*10+7);
            text = [self.calc.currentNumber description];
            break;
        case 8:
            self.calc.currentNumber = @([self.calc.currentNumber intValue]*10+8);
            text = [self.calc.currentNumber description];
            break;
        case 9:
            self.calc.currentNumber = @([self.calc.currentNumber intValue]*10+9);
            text = [self.calc.currentNumber description];
            break;
        default:
            break;
    }
    
    [self updateUI:text];
}

- (IBAction)operationPressed:(UIButton *)sender
{
    NSString *text = @"";
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
        //clear
        case 12:
            self.calc.currentNumber = @0;
            self.calc.result = @0;
            text = @"";
        //sine
        case 13:
            self.calc.result = @(sin([self.calc.currentNumber doubleValue]));
            text = [self.calc.result description];
            break;
        //cosine
        case 14:
            self.calc.result = @(cos([self.calc.currentNumber doubleValue]));
            text = [self.calc.result description];
            break;
        //tangent
        case 15:
            self.calc.result = @(tan([self.calc.currentNumber doubleValue]));
            text = [self.calc.result description];
            break;
        //secant
        case 16:
            self.calc.result = @(1/sin([self.calc.currentNumber doubleValue]));
            text = [self.calc.result description];
            break;
        //cosecant
        case 17:
            self.calc.result = @(1/cos([self.calc.currentNumber doubleValue]));
            text = [self.calc.result description];
            break;
        //cotangent
        case 18:
            self.calc.result = @(1/tan([self.calc.currentNumber doubleValue]));
            text = [self.calc.result description];
            break;
        default:
            break;
    }
    [self updateUI:text];
}

- (IBAction)decimalPressed:(UIButton *)sender
{
    
}

- (void) updateUI:(NSString *)text
{
    self.display.text = text;
}

@end
