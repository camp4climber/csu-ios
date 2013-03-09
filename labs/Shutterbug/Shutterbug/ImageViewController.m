//
//  ImageViewController.m
//  Shutterbug
//
//  Created by Tim Whitaker on 3/7/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ImageViewController

- (void) setImageURL:(NSURL *)imageURL
{
    _imageURL = imageURL;
    [self resetImage];
}

- (void) resetImage
{
    if (self.scrollView)
    {
        self.scrollView.zoomScale = 1.0;
        self.scrollView.contentSize = CGSizeZero;
        self.imageView.image        = nil;
        NSData *imageData           = [[NSData alloc] initWithContentsOfURL:self.imageURL];
        UIImage *image              = [[UIImage alloc] initWithData:imageData];
        
        if (image)
        {
            self.scrollView.contentSize = image.size;
            self.imageView.image        = image;
            self.imageView.frame        = CGRectMake(0, 0, image.size.width, image.size.height);
        }
    }
}

- (UIImageView *)imageView
{
    if (!_imageView)
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    return _imageView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.scrollView addSubview:self.imageView];
   
    self.scrollView.minimumZoomScale = 0.2;
    self.scrollView.maximumZoomScale = 5.0;
    self.scrollView.delegate         = self;
    
    [self resetImage];
}

#pragma mark - UIScrollViewDelegate
- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

@end
