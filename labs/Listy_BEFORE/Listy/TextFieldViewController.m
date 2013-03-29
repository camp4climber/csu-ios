//
//  TextFieldViewController.m
//  Listy
//
//  Created by Chris Morris on 3/28/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "TextFieldViewController.h"

@interface TextFieldViewController ()

@property (nonatomic, weak) IBOutlet UITextField *textField;

@end

@implementation TextFieldViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.textField.text = self.text;

    [self.textField becomeFirstResponder];
}

- (IBAction)doneEditingTapped:(id)sender
{
    self.text = self.textField.text;
    
    [self.delegate textFieldViewControllerDidComplete:self];
}

@end
