//
//  GridImageViewController.h
//  PhotoPicker
//
//  Created by Tim Whitaker on 3/8/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GridImageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *gridImage;
@property (weak, nonatomic) IBOutlet UILabel *imageLabel;
@property (strong, nonatomic) UIImage *img;
@property (strong, nonatomic) NSString *labelText;

@end
