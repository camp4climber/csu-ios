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
    @property (nonatomic) NSString *text;
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
    
    self.calc.currentNumber = @0;
    self.calc.number2 = @0;
    self.calc.result = @0;
    self.text = @"0";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)numberPressed:(UIButton *)sender
{
    switch (sender.tag) {
        case 0:
            if ([self.display.text isEqual:@"0"])
            {
                self.text = @"0";
            }
            else
            {
                self.text = [self.text stringByAppendingString:@"0"];
            }
            break;
        case 1:
            if ([self.display.text isEqual:@"0"])
            {
                self.text = @"1";
            }
            else
            {
            self.text = [self.text stringByAppendingString:@"1"];
            }
            break;
        case 2:
            if ([self.display.text isEqual:@"0"])
            {
                self.text = @"2";
            }
            else
            {
                self.text = [self.text stringByAppendingString:@"2"];
            }
            break;
        case 3:
            if ([self.display.text isEqual:@"0"])
            {
                self.text = @"3";
            }
            else
            {
                self.text = [self.text stringByAppendingString:@"3"];
            }
            break;
        case 4:
            if ([self.display.text isEqual:@"0"])
            {
                self.text = @"4";
            }
            else
            {
                self.text = [self.text stringByAppendingString:@"4"];
            }
            break;
        case 5:
            if ([self.display.text isEqual:@"0"])
            {
                self.text = @"5";
            }
            else
            {
                self.text = [self.text stringByAppendingString:@"5"];
            }
            break;
        case 6:
            if ([self.display.text isEqual:@"0"])
            {
                self.text = @"6";
            }
            else
            {
                self.text = [self.text stringByAppendingString:@"6"];
            }
            break;
        case 7:
            if ([self.display.text isEqual:@"0"])
            {
                self.text = @"7";
            }
            else
            {
                self.text = [self.text stringByAppendingString:@"7"];
            }
            break;
        case 8:
            if ([self.display.text isEqual:@"0"])
            {
                self.text = @"8";
            }
            else
            {
                self.text = [self.text stringByAppendingString:@"8"];
            }
            break;
        case 9:
            if ([self.display.text isEqual:@"0"])
            {
                self.text = @"9";
            }
            else
            {
                self.text = [self.text stringByAppendingString:@"9"];
            }
            break;
        default:
            break;
    }
    
    [self updateUI:self.text];
}

- (IBAction)operationPressed:(UIButton *)sender
{
    self.calc.currentNumber = @([self.display.text doubleValue]);
    id plusButton = [self.view viewWithTag:22];
    id minButton = [self.view viewWithTag:23];
    id multButton = [self.view viewWithTag:24];
    id divButton = [self.view viewWithTag:25];
    id powButton = [self.view viewWithTag:27];

    

    switch (sender.tag) {
        //multiply current number by pi
        case 10:
            self.calc.result = [self.calc unaryFunction:@"pi" withNumber:self.calc.currentNumber];
            self.calc.currentNumber = self.calc.result;
            self.text = [self.calc.result description];
            self.calc.result = @0;
            [self updateUI:self.text];
            break;
        //multiply current number by e
        case 11:
            self.calc.result = [self.calc unaryFunction:@"e" withNumber:self.calc.currentNumber];
            self.calc.currentNumber = self.calc.result;
            self.text = [self.calc.result description];
            self.calc.result = @0;
            [self updateUI:self.text];
            break;
        //clear
        case 12:
            
            [powButton setSelected:NO];
            [plusButton setSelected:NO];
            [minButton setSelected:NO];
            [multButton setSelected:NO];
            [divButton setSelected:NO];
            
            self.calc.currentNumber = @0;
            self.calc.number2 = @0;
            self.calc.result = @0;
            self.text = @"0";
            [self updateUI:self.text];
        //sine
        case 13:
            self.calc.result = [self.calc trigFunction:@"sin" withNumber:self.calc.currentNumber];
            self.calc.currentNumber = self.calc.result;
            self.text = [self.calc.result description];
            self.calc.result = @0;
            [self updateUI:self.text];
            break;
        //cosine
        case 14:
            self.calc.result = [self.calc trigFunction:@"cos" withNumber:self.calc.currentNumber];
            self.calc.currentNumber = self.calc.result;
            self.text = [self.calc.result description];
            self.calc.result = @0;
            [self updateUI:self.text];
            break;
        //tangent
        case 15:
            self.calc.result = [self.calc trigFunction:@"tan" withNumber:self.calc.currentNumber];
            self.calc.currentNumber = self.calc.result;
            self.text = [self.calc.result description];
            self.calc.result = @0;
            [self updateUI:self.text];
            break;
        //secant
        case 16:
            self.calc.result = [self.calc trigFunction:@"sec" withNumber:self.calc.currentNumber];
            self.calc.currentNumber = self.calc.result;
            self.text = [self.calc.result description];
            self.calc.result = @0;
            [self updateUI:self.text];
            break;
        //cosecant
        case 17:
            self.calc.result = [self.calc trigFunction:@"csc" withNumber:self.calc.currentNumber];
            self.calc.currentNumber = self.calc.result;
            self.text = [self.calc.result description];
            self.calc.result = @0;
            [self updateUI:self.text];
            break;
        //cotangent
        case 18:
            self.calc.result = [self.calc trigFunction:@"cot" withNumber:self.calc.currentNumber];
            self.calc.currentNumber = self.calc.result;
            self.text = [self.calc.result description];
            self.calc.result = @0;
            [self updateUI:self.text];
            break;
        //memory store
        case 19:
            self.calc.memoryValue = self.calc.currentNumber;
            break;
        //memory recall
        case 20:
            self.calc.currentNumber = self.calc.memoryValue;
            self.text = [self.calc.currentNumber description];
            [self updateUI:self.text];
            break;
        //memory clear
        case 21:
            self.calc.memoryValue = @0;
            break;
        //add
        case 22:
            
            [sender setSelected:YES];
            [powButton setSelected:NO];
            [minButton setSelected:NO];
            [multButton setSelected:NO];
            [divButton setSelected:NO];
            
            
            self.calc.operation = @"+";
            self.calc.number2 = [self.calc performOperation];
            self.calc.currentNumber = @0;
            self.text = @"";
            break;
        //subtract
        case 23:
            
            [sender setSelected:YES];
            [plusButton setSelected:NO];
            [powButton setSelected:NO];
            [multButton setSelected:NO];
            [divButton setSelected:NO];
            
            
            self.calc.operation = @"-";
            self.calc.number2 = [self.calc performOperation];
            self.calc.currentNumber = @0;
            self.text = @"";
            break;
        //multiply
        case 24:
            
            [sender setSelected:YES];
            [plusButton setSelected:NO];
            [minButton setSelected:NO];
            [powButton setSelected:NO];
            [divButton setSelected:NO];
            
           
            self.calc.operation = @"*";
            self.calc.number2 = [self.calc performOperation];
            self.calc.currentNumber = @0;
            self.text = @"";
            break;
        //divide
        case 25:
            
            [sender setSelected:YES];
            [plusButton setSelected:NO];
            [minButton setSelected:NO];
            [multButton setSelected:NO];
            [powButton setSelected:NO];
            
            self.calc.operation = @"/";
            self.calc.number2 = [self.calc performOperation];
            self.calc.currentNumber = @0;
            self.text = @"";
            break;
        //square root
        case 26:
            self.calc.result = [self.calc unaryFunction:@"sqrt" withNumber:self.calc.currentNumber];
            self.calc.currentNumber = self.calc.result;
            self.text = [self.calc.result description];
            self.calc.result = @0;
            [self updateUI:self.text];
            break;
        //exponent
        case 27:
            
            [sender setSelected:YES];
            [plusButton setSelected:NO];
            [minButton setSelected:NO];
            [multButton setSelected:NO];
            [divButton setSelected:NO];
            
            
            self.calc.operation = @"^";
            self.calc.number2 = [self.calc performOperation];
            self.calc.currentNumber = @0;
            self.text = @"";
            break;
        //equals
        case 28:
    
            [powButton setSelected:NO];
            [plusButton setSelected:NO];
            [minButton setSelected:NO];
            [multButton setSelected:NO];
            [divButton setSelected:NO];
                
            self.calc.result = [self.calc performOperation];
            self.text = [self.calc.result description];
            self.calc.currentNumber = @0;
            [self updateUI:self.text];
            break;
        //plusminus
        case 29:
            self.calc.result = [self.calc unaryFunction:@"plusminus" withNumber:self.calc.currentNumber];
            self.calc.currentNumber = self.calc.result;
            self.text = [self.calc.result description];
            self.calc.result = @0;
            [self updateUI:self.text];
            break;
        //decimal
        case 30:
            if ([self.display.text rangeOfString:@"."].length > 0) {
                break;
            }
            self.text = [self.display.text stringByAppendingString:@"."];
            break;
        //LOG
        case 31:
            self.calc.result = [self.calc unaryFunction:@"log" withNumber:self.calc.currentNumber];
            self.calc.currentNumber = self.calc.result;
            self.text = [self.calc.result description];
            self.calc.result = @0;
            [self updateUI:self.text];
            break;
        //LN
        case 32:
            self.calc.result = [self.calc unaryFunction:@"ln" withNumber:self.calc.currentNumber];
            self.calc.currentNumber = self.calc.result;
            self.text = [self.calc.result description];
            self.calc.result = @0;
            [self updateUI:self.text];
            break;
        //reciprocal
        case 33:
            self.calc.result = [self.calc unaryFunction:@"reciprocal" withNumber:self.calc.currentNumber];
            self.calc.currentNumber = self.calc.result;
            self.text = [self.calc.result description];
            self.calc.result = @0;
            [self updateUI:self.text];
            break;
        default:
            break;
    }
}


- (void) updateUI:(NSString *)text
{
    self.display.text = text;
}

@end
