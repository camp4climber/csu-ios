//
//  TopoShotViewController.m
//  TopoShot
//
//  Created by Tim Whitaker on 3/11/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "TopoShotViewController.h"

@interface TopoShotViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView *imageView;

@end

CGPoint location;

@implementation TopoShotViewController

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
    
    [self.scrollView addSubview:self.imageView];
    self.scrollView.minimumZoomScale = 0.2;
    self.scrollView.maximumZoomScale = 3.0;
    self.scrollView.delegate = self;
    [self resetImage];
    
}

- (void) viewDidAppear:(BOOL)animated
{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImageView *)imageView
{
    if (!_imageView)
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    return _imageView;
}

- (void) resetImage
{
    if (self.scrollView)
    {
        self.scrollView.zoomScale = 1.0;
        self.scrollView.contentSize = CGSizeZero;
        self.imageView.image = self.image;
        self.imageView.frame = CGRectMake(0, 0, self.image.size.width, self.image.size.height);
    }
}

- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}


- (IBAction)toolChanged:(UISegmentedControl *)sender {
}

- (void) drawRect:(CGRect)rect
{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path moveToPoint:location];
    [path addArcWithCenter:location radius:5 startAngle:0 endAngle:360 clockwise:YES];
    [[UIColor blackColor] setStroke];
    [[UIColor whiteColor] setFill];
    [path stroke];
    [path fill];
}
@end
