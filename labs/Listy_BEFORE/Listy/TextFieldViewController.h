//
//  TextFieldViewController.h
//  Listy
//
//  Created by Chris Morris on 3/28/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TextFieldViewControllerDelegate;

@interface TextFieldViewController : UIViewController

@property (nonatomic, strong) NSString *text;
@property (nonatomic, weak  ) id <TextFieldViewControllerDelegate> delegate;

@end

@protocol TextFieldViewControllerDelegate <NSObject>

- (void)textFieldViewControllerDidComplete:(TextFieldViewController *)controller;

@end