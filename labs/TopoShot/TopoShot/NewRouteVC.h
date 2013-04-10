//
//  NewRouteVC.h
//  TopoShot
//
//  Created by Tim Whitaker on 3/29/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewRouteVC : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *routeImageView;
@property (weak, nonatomic) IBOutlet UIButton *useImageButton;
- (IBAction)pickImage:(UIBarButtonItem *)sender;
- (IBAction)useImage:(UIButton *)sender;

@end
