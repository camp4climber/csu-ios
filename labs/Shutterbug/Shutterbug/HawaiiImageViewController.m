//
//  HawaiiImageViewController.m
//  Shutterbug
//
//  Created by Tim Whitaker on 3/7/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "HawaiiImageViewController.h"
#define IMAGE_URL @"http://images.apple.com/v/iphone/gallery/a/images/photo_3.jpg"

@interface HawaiiImageViewController ()

@end

@implementation HawaiiImageViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    self.imageURL = [[NSURL alloc] initWithString:IMAGE_URL];
}

@end
