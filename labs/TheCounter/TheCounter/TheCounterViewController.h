//
//  TheCounterViewController.h
//  TheCounter
//
//  Created by Tim Whitaker on 2/7/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Counter.h"

@interface TheCounterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *oneX;
@property (weak, nonatomic) IBOutlet UILabel *twoX;
@property (weak, nonatomic) IBOutlet UILabel *threeX;

@property (nonatomic) Counter *byOneCounter;

- (void) update;

@end
