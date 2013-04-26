//
//  InfoEditVC.h
//  TopoShot
//
//  Created by Tim Whitaker on 4/24/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Route.h"

@interface InfoEditVC : UIViewController
@property (strong, nonatomic) Route *route;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *difficultyField;
@property (weak, nonatomic) IBOutlet UITextView *notesField;

@end
