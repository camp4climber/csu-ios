//
//  GridImageViewController.m
//  PhotoPicker
//
//  Created by Tim Whitaker on 3/8/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "GridImageViewController.h"

@interface GridImageViewController ()

@end

@implementation GridImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.gridImage.image = self.img;
    self.title = self.labelText;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
