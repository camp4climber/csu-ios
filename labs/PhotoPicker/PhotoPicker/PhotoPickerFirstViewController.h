//
//  PhotoPickerFirstViewController.h
//  PhotoPicker
//
//  Created by Tim Whitaker on 2/25/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoPickerFirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIPickerView *photoPicker;
@property (weak, nonatomic) IBOutlet UIImageView *photoImage;
- (IBAction)alphaSlider:(UISlider *)sender;
- (IBAction)tapToHidePicker:(UITapGestureRecognizer *)sender;
- (IBAction)swipeLeft:(UISwipeGestureRecognizer *)sender;
- (IBAction)swipeRight:(UISwipeGestureRecognizer *)sender;
- (IBAction)swipeUp:(UISwipeGestureRecognizer *)sender;
- (IBAction)swipeDown:(UISwipeGestureRecognizer *)sender;
@end
