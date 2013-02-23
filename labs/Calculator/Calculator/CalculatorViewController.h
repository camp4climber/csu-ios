//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Tim Whitaker on 2/14/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController

- (IBAction)numberPressed:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *display;
- (IBAction)swipeRightAdd:(UISwipeGestureRecognizer *)sender;
- (IBAction)swipeUpMinus:(UISwipeGestureRecognizer *)sender;
- (IBAction)swipeLeftMultiply:(UISwipeGestureRecognizer *)sender;
- (IBAction)swipeDownDivide:(UIGestureRecognizer *) sender;
- (IBAction)doubleTapEqual:(UITapGestureRecognizer *)sender;

- (void) updateUI:(NSString *)text;

@end
