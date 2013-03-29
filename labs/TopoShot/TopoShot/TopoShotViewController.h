//
//  TopoShotViewController.h
//  TopoShot
//
//  Created by Tim Whitaker on 3/11/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopoShotViewController : UIViewController

@property (strong, nonatomic) UIImage *image;
@property (weak, nonatomic) IBOutlet UISegmentedControl *toolMenu;
- (IBAction)toolChanged:(UISegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
