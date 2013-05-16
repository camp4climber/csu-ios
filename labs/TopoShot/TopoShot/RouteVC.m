//
//  RouteVC.m
//  TopoShot
//
//  Created by Tim Whitaker on 4/24/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "RouteVC.h"
#import "RouteInfoVC.h"

@interface RouteVC () <UIScrollViewDelegate>

@property (nonatomic, strong) UIView *containerView;

@end

@implementation RouteVC

- (UIView *) containerView
{
    if (!_containerView)
    {
        _containerView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _containerView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.title = self.route.name;
    
    [self.routeScrollView addSubview:self.containerView];
    [self.containerView   addSubview:self.route.baseImageView];
    [self.containerView   addSubview:self.route.routeView];
    [self.containerView   addSubview:self.route.descView];
    [self.containerView   addSubview:self.route.boltView];
    
    self.routeScrollView.minimumZoomScale = 0.1;
    self.routeScrollView.maximumZoomScale = 1.0;
    self.routeScrollView.delegate         = self;
    
    [self.route.boltView  setUserInteractionEnabled:NO];
    [self.route.descView  setUserInteractionEnabled:NO];
    [self.route.routeView setUserInteractionEnabled:NO];
    
    self.route.routeView.zoom = self.routeScrollView.zoomScale;
    
    [self reset];
}

- (void) reset
{
    if (self.routeScrollView)
    {
        self.routeScrollView.zoomScale   = 1.0;
        self.routeScrollView.contentSize = CGSizeZero;
        self.routeScrollView.contentMode = UIViewContentModeScaleAspectFit;
        
        self.route.baseImageView.image = self.route.baseImage;
        [self.route.baseImageView sizeToFit];
        
        CGFloat width  = self.route.baseImageView.frame.size.width;
        CGFloat height = self.route.baseImageView.frame.size.height;
        
        self.route.boltView.frame      = CGRectMake(0, 0, width, height);
        self.route.routeView.frame     = CGRectMake(0, 0, width, height);
        self.route.descView.frame      = CGRectMake(0, 0, width, height);
        self.containerView.frame       = CGRectMake(0, 0, width, height);
        
        self.route.routeView.backgroundColor = [UIColor clearColor];
        
        [self.routeScrollView setContentSize:CGSizeMake(self.containerView.frame.size.width, self.containerView.frame.size.height)];
        self.routeScrollView.zoomScale = 0.2;
    }
}

- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.containerView;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RouteInfoVC *vc = segue.destinationViewController;
    vc.route = self.route;
}


@end
