//
//  ImageViewController.h
//  Shutterbug
//
//  Created by Tim Whitaker on 3/7/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController

@property (nonatomic, strong) NSURL *imageURL;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
