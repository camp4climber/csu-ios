//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Tim Whitaker on 2/14/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController

- (IBAction)zero:(UIButton *)sender;
- (IBAction)one:(UIButton *)sender;
- (IBAction)two:(UIButton *)sender;
- (IBAction)three:(UIButton *)sender;
- (IBAction)four:(UIButton *)sender;
- (IBAction)five:(UIButton *)sender;
- (IBAction)six:(UIButton *)sender;
- (IBAction)seven:(UIButton *)sender;
- (IBAction)eight:(UIButton *)sender;
- (IBAction)nine:(UIButton *)sender;
- (IBAction)decimal:(UIButton *)sender;
- (IBAction)plusminus:(UIButton *)sender;
- (IBAction)equals:(UIButton *)sender;
- (IBAction)plus:(UIButton *)sender;
- (IBAction)minus:(UIButton *)sender;
- (IBAction)multiply:(UIButton *)sender;
- (IBAction)divide:(UIButton *)sender;
- (IBAction)sqrt:(UIButton *)sender;
- (IBAction)reciprocal:(UIButton *)sender;
- (IBAction)clear:(UIButton *)sender;
- (IBAction)mem:(UIButton *)sender;
- (IBAction)memstore:(UIButton *)sender;
- (IBAction)memclear:(UIButton *)sender;

- (void) updateUI;

@end
