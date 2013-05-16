//
//  RouteInfoVC.h
//  TopoShot
//
//  Created by Tim Whitaker on 5/15/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Route.h"

@interface RouteInfoVC : UIViewController

@property (nonatomic, strong) Route *route;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *difficultyLabel;
@property (weak, nonatomic) IBOutlet UITextView *notesTextView;

@end
