//
//  LifeCycleFirstViewController.h
//  LifeCycle
//
//  Created by Tim Whitaker on 2/14/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LifeCycleFirstViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *lifeCycleList;
- (IBAction)clear:(UIButton *)sender;

@end
