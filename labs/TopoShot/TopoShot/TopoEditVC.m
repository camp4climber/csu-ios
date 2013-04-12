//
//  TopoEditVC.m
//  TopoShot
//
//  Created by Tim Whitaker on 3/29/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "TopoEditVC.h"

@interface TopoEditVC () <UIScrollViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *boltView;
@property (nonatomic, strong) NSArray *colors;
@property (nonatomic) int boltColorIndex;
@property (nonatomic) int routeColorIndex;
@property (nonatomic) int textColorIndex;

@end

@implementation TopoEditVC

- (UIView *) containerView
{
    if (!_containerView)
    {
        _containerView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _containerView;
}

- (UIImageView *) imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _imageView;
}

- (UIView *) boltView
{
    if (!_boltView)
    {
        _boltView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _boltView;
}

- (NSArray *) colors
{
    if (!_colors)
    {
        _colors = [[NSArray alloc] initWithObjects:[UIColor whiteColor], [UIColor cyanColor], [UIColor blueColor], [UIColor purpleColor], [UIColor magentaColor], [UIColor redColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor greenColor], [UIColor blackColor], [UIColor darkGrayColor], [UIColor grayColor], [UIColor lightGrayColor], nil];
    }
    return _colors;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    self.boltColorIndex  = 0;
    self.routeColorIndex = 0;
    self.textColorIndex  = 0;
    
    [self.routeScrollView addSubview:self.containerView];
    [self.containerView   addSubview:self.imageView];
    [self.containerView   addSubview:self.boltView];
    
    self.routeScrollView.minimumZoomScale = 0.1;
    self.routeScrollView.maximumZoomScale = 1.0;
    self.routeScrollView.delegate         = self;
    
    [self reset];
    
    
    UITapGestureRecognizer *singleTapRecognizer  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    singleTapRecognizer.numberOfTapsRequired     = 1;
    singleTapRecognizer.numberOfTouchesRequired  = 1;
    [self.routeScrollView addGestureRecognizer:singleTapRecognizer];
    
    UITapGestureRecognizer *twoFingerTapRecognizer  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingerTap:)];
    twoFingerTapRecognizer.numberOfTouchesRequired  = 2;
    twoFingerTapRecognizer.numberOfTapsRequired     = 1;
    [self.routeScrollView addGestureRecognizer:twoFingerTapRecognizer];
    
}

- (void) reset
{
    if (self.routeScrollView)
    {
        self.routeScrollView.zoomScale   = 1.0;
        self.routeScrollView.contentSize = CGSizeZero;
        self.routeScrollView.contentMode = UIViewContentModeScaleAspectFit;
        
        self.imageView.image = self.routeImage;
        [self.imageView sizeToFit];
        
        self.boltView.frame = CGRectMake(0, 0, self.imageView.frame.size.width, self.imageView.frame.size.height);
        
        self.containerView.frame = CGRectMake(0, 0, self.imageView.frame.size.width, self.imageView.frame.size.height);
        
        [self.routeScrollView setContentSize:CGSizeMake(self.containerView.frame.size.width, self.containerView.frame.size.height)];
    }
}

- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.containerView;
}

//Add Bolt
- (void) singleTap:(UITapGestureRecognizer *)recognizer
{
    CGPoint location    = [recognizer locationInView:self.routeScrollView];
    CGFloat scaleFactor = [self.routeScrollView zoomScale];
    CGFloat factoredX   = location.x * (1/scaleFactor);
    CGFloat factoredY   = location.y * (1/scaleFactor);
    
    NSLog(@"%f - %f:%f", scaleFactor, factoredX, factoredY);
    
    switch (self.toolBar.selectedSegmentIndex)
    {
        //Bolts
        case 0:
            if (factoredX < self.boltView.frame.size.width && factoredY < self.boltView.frame.size.height)
            {                
                UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(factoredX-75, factoredY-75, 150, 150)];
                label.text = @"x";
                [label setTextColor:[UIColor whiteColor]];
                [label setBackgroundColor:[UIColor clearColor]];
                label.font = [UIFont fontWithName:@"helvetica" size:150];
                label.textAlignment = NSTextAlignmentCenter;
                label.userInteractionEnabled = YES;
                
                [self.boltView addSubview:label];
                
                UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
                [label addGestureRecognizer:panRecognizer];
                
                UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
                doubleTapRecognizer.numberOfTapsRequired = 2;
                doubleTapRecognizer.numberOfTouchesRequired = 1;
                [label addGestureRecognizer:doubleTapRecognizer];
                
//                UILongPressGestureRecognizer *longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
//                longPressRecognizer.minimumPressDuration = 0.5;
//                [label addGestureRecognizer:longPressRecognizer];
            }
            break;
        
        //Route
        case 1:
            break;
        
        //Text
        case 2:
            break;
    }
}

//Add anchor
- (void) twoFingerTap:(UITapGestureRecognizer *)recognizer
{
    CGPoint location = [recognizer locationInView:self.routeScrollView];
    CGFloat scaleFactor = [self.routeScrollView zoomScale];
    CGFloat factoredX = location.x * (1/scaleFactor);
    CGFloat factoredY = location.y * (1/scaleFactor);
    
    NSLog(@"%f - %f:%f", scaleFactor, factoredX, factoredY);
    
    switch (self.toolBar.selectedSegmentIndex)
    {
        //Bolts
        case 0:
            if (factoredX < self.boltView.frame.size.width && factoredY < self.boltView.frame.size.height)
            {
                UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(factoredX-150, factoredY-150, 300, 300)];
                label.text = @"x x";
                [label setTextColor:[UIColor whiteColor]];
                [label setBackgroundColor:[UIColor clearColor]];
                label.font = [UIFont fontWithName:@"helvetica" size:150];
                label.textAlignment = NSTextAlignmentCenter;
                label.userInteractionEnabled = YES;
                
                [self.boltView addSubview:label];
                
                UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
                [label addGestureRecognizer:panRecognizer];
            }
            break;
        
        //Route
        case 1:
            break;
    }
}

//Move stuff
- (void) pan:(UIPanGestureRecognizer *)recognizer
{
    NSLog(@"Panning");
   
    UILabel *label = (UILabel *)recognizer.view;
	CGPoint translation = [recognizer translationInView:label];
    
	// move label
	label.center = CGPointMake(label.center.x + translation.x,
                               label.center.y + translation.y);
    
	// reset translation
	[recognizer setTranslation:CGPointZero inView:label];
}

- (void) doubleTap:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"Double Tapped");
    
    [recognizer.view removeFromSuperview];
}

- (IBAction)changeColor:(UIBarButtonItem *)sender
{
    UIColor *color = [self nextColor];
    switch (self.toolBar.selectedSegmentIndex)
    {
        //Bolts
        case 0:
            for (UIView *v in [self.boltView subviews])
            {
                if ([v isKindOfClass:[UILabel class]])
                {
                    [(UILabel *)v setTextColor:color];
                }
            }
            break;
            
        //Route
        case 1:
            break;
            
        //Text
        case 2:
            break;
    }
}

- (UIColor *) nextColor
{
    switch (self.toolBar.selectedSegmentIndex)
    {
        //Bolts
        case 0:
            if (self.boltColorIndex >= (self.colors.count-1))
            {
                self.boltColorIndex = 0;
            }
            else
            {
                self.boltColorIndex++;
            }
            return self.colors[self.boltColorIndex];
            break;
            
        //Route
        case 1:
            if (self.routeColorIndex >= (self.colors.count-1))
            {
                self.routeColorIndex = 0;
            }
            else
            {
                self.routeColorIndex++;
            }
            return self.colors[self.routeColorIndex];
            break;
            
        //Text
        case 2:
            if (self.textColorIndex >= (self.colors.count-1))
            {
                self.textColorIndex = 0;
            }
            else
            {
                self.textColorIndex++;
            }
            return self.colors[self.textColorIndex];
            break;
    }
    return [UIColor whiteColor];
}
@end
