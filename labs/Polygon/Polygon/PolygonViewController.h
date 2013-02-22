//
//  PolygonViewController.h
//  Polygon
//
//  Created by Tim Whitaker on 2/21/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PolygonView.h"

@interface PolygonViewController : UIViewController
- (IBAction)slider:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet PolygonView *polygon;

@end
