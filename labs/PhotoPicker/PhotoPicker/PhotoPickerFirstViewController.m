//
//  PhotoPickerFirstViewController.m
//  PhotoPicker
//
//  Created by Tim Whitaker on 2/25/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "PhotoPickerFirstViewController.h"
#import "PhotoLibrary.h"

@interface PhotoPickerFirstViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) PhotoLibrary *photoLibrary;

@end

@implementation PhotoPickerFirstViewController

- (PhotoLibrary *) photoLibrary
{
    if (!_photoLibrary)
        _photoLibrary = [[PhotoLibrary alloc] init];
    return _photoLibrary;
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger num = 0;
    
    switch (component)
    {
        case 0:
            num = [self.photoLibrary numberOfCategories];
            break;
        case 1:
            num = [self.photoLibrary numberOfPhotosInCategory];
            break;
    }
    return num;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray *categories = [self.photoLibrary.photos allKeys];
    
    switch (component)
    {
        case 0:
            return categories[row];
            break;
        case 1:
            return [self.photoLibrary nameForPhotoAtPosition:row];
        //    return photos[row];
            break;
    }
    return @"x";
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    UIImage *img;
    switch (component)
    {
        case 0:
            self.photoLibrary.currentCategory = [[self.photoLibrary.photos allKeys] objectAtIndex:row];
            [self.photoPicker reloadComponent:1];
            img = [self.photoLibrary imageForPhotoAtPosition:row];
            [self update:img];
            break;
        case 1:
            img = [self.photoLibrary imageForPhotoAtPosition:row];
            [self update:img];
            break;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.photoImage.image = [self.photoLibrary imageForPhotoAtPosition:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) update:(UIImage *)image
{
    self.photoImage.image = image;
}

- (IBAction)alphaSlider:(UISlider *)sender {
    self.photoImage.alpha = sender.value;
}

- (IBAction)tapToHidePicker:(UITapGestureRecognizer *)sender {
    if (self.photoPicker.alpha == 0)
        self.photoPicker.alpha = 1;
    else
        self.photoPicker.alpha = 0;
}

- (IBAction)swipeLeft:(UISwipeGestureRecognizer *)sender
{
    NSUInteger currentRow = [self.photoPicker selectedRowInComponent:1];
    NSUInteger next = 0;
    NSUInteger numberOfRows = [self.photoLibrary numberOfPhotosInCategory];
    UIImage *img;
    
    if (currentRow < numberOfRows-1)
        next = currentRow + 1;
    [self.photoPicker selectRow:next inComponent:1 animated:NO];
    img = [self.photoLibrary imageForPhotoAtPosition:next];
    [self update:img];
}

- (IBAction)swipeRight:(UISwipeGestureRecognizer *)sender
{
    NSUInteger currentRow = [self.photoPicker selectedRowInComponent:1];
    NSUInteger previous = 0;
    UIImage *img;
    
    if (currentRow!=0)
        previous = currentRow - 1;
    [self.photoPicker selectRow:previous inComponent:1 animated:NO];
    img = [self.photoLibrary imageForPhotoAtPosition:previous];
    [self update:img];

}

- (IBAction)swipeUp:(UISwipeGestureRecognizer *)sender
{
    NSUInteger currentRow = [self.photoPicker selectedRowInComponent:0];
    NSUInteger previous = 0;
    UIImage *img;
    
    if (currentRow != 0)
    {
        previous = currentRow - 1;
        self.photoLibrary.currentCategory = [[self.photoLibrary.photos allKeys] objectAtIndex:previous];
        [self.photoPicker reloadComponent:1];
    }
    [self.photoPicker selectRow:previous inComponent:0 animated:NO];
    img = [self.photoLibrary imageForPhotoAtPosition:previous];
    [self update:img];
}

- (IBAction)swipeDown:(UISwipeGestureRecognizer *)sender
{
    NSUInteger currentRow = [self.photoPicker selectedRowInComponent:0];
    NSUInteger next = 0;
    NSUInteger numberOfRows = [self.photoLibrary numberOfCategories];
    UIImage *img;
    
    if (currentRow < numberOfRows-1)
    {
        next = currentRow + 1;
        self.photoLibrary.currentCategory = [[self.photoLibrary.photos allKeys] objectAtIndex:next];
        [self.photoPicker reloadComponent:1];
    }
    [self.photoPicker selectRow:next inComponent:0 animated:NO];
    img = [self.photoLibrary imageForPhotoAtPosition:next];
    [self update:img];
}


@end
