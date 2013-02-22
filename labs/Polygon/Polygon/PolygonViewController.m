//
//  PolygonViewController.m
//  Polygon
//
//  Created by Tim Whitaker on 2/21/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "PolygonViewController.h"
#import "PolygonView.h"

@interface PolygonViewController ()

@end

@implementation PolygonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.polygon.numberOfSides = 3;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)slider:(UISlider *)sender {
    self.polygon.numberOfSides = sender.value;
}
@end
