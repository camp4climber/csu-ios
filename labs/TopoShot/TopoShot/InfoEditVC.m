//
//  InfoEditVC.m
//  TopoShot
//
//  Created by Tim Whitaker on 4/24/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "InfoEditVC.h"
#import "RouteList.h"

@interface InfoEditVC () <UITextFieldDelegate, UITextViewDelegate>

@end

@implementation InfoEditVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (void) textFieldDidEndEditing:(UITextField *)textField
{
    switch (textField.tag)
    {
        case 0:
            self.route.name = self.nameField.text;
            break;
        case 1:
            self.route.difficulty = self.difficultyField.text;
            break;
    }
}

- (void) textViewDidEndEditing:(UITextView *)textView
{
    self.route.notes = self.notesField.text;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    self.route.name       = self.nameField.text;
    self.route.difficulty = self.difficultyField.text;
    self.route.notes      = self.notesField.text;
}

@end
