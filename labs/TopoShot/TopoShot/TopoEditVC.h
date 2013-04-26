//
//  TopoEditVC.h
//  TopoShot
//
//  Created by Tim Whitaker on 3/29/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Route.h"

@interface TopoEditVC : UIViewController

@property (strong, nonatomic) Route *route;
@property (weak, nonatomic) IBOutlet UIScrollView *routeScrollView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *toolBar;
- (IBAction)changeTool:(UISegmentedControl *)sender;

@end
