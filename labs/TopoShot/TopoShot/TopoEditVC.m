//
//  TopoEditVC.m
//  TopoShot
//
//  Created by Tim Whitaker on 3/29/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "TopoEditVC.h"
#import "RouteView.h"
#import "UIView+findFirstResponder.h"
#import "InfoEditVC.h"
#import "EditMenuGR.h"
#import "HelpVC.h"

@interface TopoEditVC () <UIScrollViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) HelpVC *helpViewController;
@property (nonatomic) ButtonType currentTool;

@end

@implementation TopoEditVC

- (HelpVC *) helpViewController
{
    if (!_helpViewController)
    {
        _helpViewController = [[HelpVC alloc] init];
    }
    return _helpViewController;
}

- (UIView *) containerView
{
    if (!_containerView)
    {
        _containerView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _containerView;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [self.routeScrollView addSubview:self.containerView];
    [self.containerView   addSubview:self.route.baseImageView];
    [self.containerView   addSubview:self.route.routeView];
    [self.containerView   addSubview:self.route.descView];
    [self.containerView   addSubview:self.route.boltView];

    self.routeScrollView.minimumZoomScale = 0.1;
    self.routeScrollView.maximumZoomScale = 1.5;
    self.routeScrollView.delegate         = self;
    
    [self.route.routeView setUserInteractionEnabled:YES];
    self.route.routeView.zoom = self.routeScrollView.zoomScale;
    
    [self reset];
    
    self.currentTool = bolt;
    [self.currentToolImageView setUserInteractionEnabled:YES];
    
    UITapGestureRecognizer *doubleTapDependency = [[UITapGestureRecognizer alloc] initWithTarget:self action:nil];
    doubleTapDependency.numberOfTapsRequired = 2;
    doubleTapDependency.numberOfTouchesRequired = 1;
    [self.routeScrollView addGestureRecognizer:doubleTapDependency];
    
    EditMenuGR *editMenuRecognizer = [[EditMenuGR alloc] initWithTarget:self action:@selector(changeToolMenu:)];
    editMenuRecognizer.numberOfTouchesRequired = 1;
    editMenuRecognizer.minimumPressDuration    = 0.5;
    [editMenuRecognizer requireGestureRecognizerToFail:doubleTapDependency];
    [self.routeScrollView addGestureRecognizer:editMenuRecognizer];
    
    UITapGestureRecognizer *addBoltRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addBolt:)];
    addBoltRecognizer.numberOfTapsRequired    = 1;
    addBoltRecognizer.numberOfTouchesRequired = 1;
    [addBoltRecognizer requireGestureRecognizerToFail:doubleTapDependency];
    [self.route.boltView addGestureRecognizer:addBoltRecognizer];
    
    UITapGestureRecognizer *addAnchorRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addAnchor:)];
    addAnchorRecognizer.numberOfTouchesRequired = 2;
    addAnchorRecognizer.numberOfTapsRequired    = 1;
    [self.route.boltView addGestureRecognizer:addAnchorRecognizer];
    
    UITapGestureRecognizer *addTextRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addText:)];
    addTextRecognizer.numberOfTouchesRequired = 1;
    addTextRecognizer.numberOfTapsRequired    = 1;
    [self.route.descView addGestureRecognizer:addTextRecognizer];
    
    UITapGestureRecognizer *helpRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(revealHelp:)];
    helpRecognizer.numberOfTapsRequired    = 1;
    helpRecognizer.numberOfTouchesRequired = 1;
    [self.currentToolImageView addGestureRecognizer:helpRecognizer];
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
        self.routeScrollView.zoomScale = 1.0;
    }
}

- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.containerView;
}

- (void) addBolt:(UITapGestureRecognizer *)recognizer
{
    CGPoint location    = [recognizer locationInView:self.routeScrollView];
    CGFloat scaleFactor = [self.routeScrollView zoomScale];
    CGFloat factoredX   = location.x * (1/scaleFactor);
    CGFloat factoredY   = location.y * (1/scaleFactor);
    
    if (factoredX < self.route.boltView.frame.size.width && factoredY < self.route.boltView.frame.size.height)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(factoredX-15, factoredY-15, 30, 30)];
        label.text = @"x";
        [label setTextColor:[UIColor whiteColor]];
        [label setBackgroundColor:[UIColor clearColor]];
        label.font = [UIFont fontWithName:@"helvetica" size:30];
        label.textAlignment = NSTextAlignmentCenter;
        label.userInteractionEnabled = YES;
        
        [self.route.boltView addSubview:label];
        
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [label addGestureRecognizer:panRecognizer];
        
        UITapGestureRecognizer *removeItemRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeItem:)];
        removeItemRecognizer.numberOfTouchesRequired = 1;
        removeItemRecognizer.numberOfTapsRequired    = 2;
        [label addGestureRecognizer:removeItemRecognizer];
    }

}

- (void) addAnchor:(UITapGestureRecognizer *)recognizer
{
    CGPoint location    = [recognizer locationInView:self.routeScrollView];
    CGFloat scaleFactor = [self.routeScrollView zoomScale];
    CGFloat factoredX   = location.x * (1/scaleFactor);
    CGFloat factoredY   = location.y * (1/scaleFactor);
    
    if (factoredX < self.route.boltView.frame.size.width && factoredY < self.route.boltView.frame.size.height)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(factoredX-150, factoredY-150, 300, 300)];
        label.text = @"x x";
        [label setTextColor:[UIColor whiteColor]];
        [label setBackgroundColor:[UIColor clearColor]];
        label.font = [UIFont fontWithName:@"helvetica" size:50];
        label.textAlignment = NSTextAlignmentCenter;
        label.userInteractionEnabled = YES;
        
        [self.route.boltView addSubview:label];
        
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [label addGestureRecognizer:panRecognizer];
        
        UITapGestureRecognizer *removeItemRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeItem:)];
        removeItemRecognizer.numberOfTouchesRequired = 1;
        removeItemRecognizer.numberOfTapsRequired    = 2;
        [label addGestureRecognizer:removeItemRecognizer];
    }
}

- (void) addText:(UITapGestureRecognizer *)recognizer
{
    CGPoint location    = [recognizer locationInView:self.routeScrollView];
    CGFloat scaleFactor = [self.routeScrollView zoomScale];
    CGFloat factoredX   = location.x * (1/scaleFactor);
    CGFloat factoredY   = location.y * (1/scaleFactor);
    
    UIView *firstResponder = [[UIView alloc] init];
    firstResponder = [self.view findFirstResponder];
    
    if (firstResponder)
    {
        [self.view endEditing:YES];
    }
    else if (factoredX < self.route.descView.frame.size.width && factoredY < self.route.descView.frame.size.height)
    {
        UITextView *text = [[UITextView alloc] initWithFrame:CGRectMake(factoredX, factoredY, 150, 75)];
        [text setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
        [text setTextColor:[UIColor whiteColor]];
        text.editable = YES;
        text.font = [UIFont fontWithName:@"helvetica" size:10];
        
        [self.route.descView addSubview:text];
        
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [text addGestureRecognizer:panRecognizer];
        
        UIPanGestureRecognizer *resizeRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(resize:)];
        resizeRecognizer.minimumNumberOfTouches = 2;
        [text addGestureRecognizer:resizeRecognizer];
        
        UITapGestureRecognizer *removeItemRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeItem:)];
        removeItemRecognizer.numberOfTouchesRequired = 1;
        removeItemRecognizer.numberOfTapsRequired    = 2;
        [text addGestureRecognizer:removeItemRecognizer];
    }
}

- (void) removeItem:(UITapGestureRecognizer *)recognizer
{
    [recognizer.view removeFromSuperview];
}

- (void) pan:(UIPanGestureRecognizer *)recognizer
{
    NSLog(@"Panning");
   
    UIView *view = recognizer.view;
	CGPoint translation = [recognizer translationInView:view];
    
	view.center = CGPointMake(view.center.x + translation.x,
                               view.center.y + translation.y);
    
	[recognizer setTranslation:CGPointZero inView:view];
}

- (void) resize:(UIPanGestureRecognizer *)recognizer
{
    NSLog(@"resize");
    
    UIView *view = recognizer.view;
    CGPoint translation = [recognizer translationInView:view];
    view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width + translation.x, view.frame.size.height + translation.y);
    [recognizer setTranslation:CGPointZero inView:view];
}

- (void) scrollViewDidZoom:(UIScrollView *)scrollView
{
    self.route.routeView.zoom = scrollView.zoomScale;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    InfoEditVC *vc = segue.destinationViewController;
    vc.route = self.route;
}

- (void) changeToolMenu: (EditMenuGR *) recognizer
{
    switch (recognizer.chosenButtonType)
    {
        case bolt:
            self.currentTool                   = bolt;
            self.currentToolImageView.image    = [UIImage imageNamed:@"bolt_button_help.png"];
            self.routeScrollView.scrollEnabled = YES;
            [self.containerView bringSubviewToFront:self.route.boltView];
            break;
        case route:
            self.currentTool                   = route;
            self.currentToolImageView.image    = [UIImage imageNamed:@"route_button_help.png"];
            self.routeScrollView.scrollEnabled = NO;
            [self.routeScrollView delaysContentTouches];
            [self.containerView bringSubviewToFront:self.route.routeView];
            break;
        case text:
            self.currentTool                   = text;
            self.currentToolImageView.image    = [UIImage imageNamed:@"text_button_help.png"];
            self.routeScrollView.scrollEnabled = YES;
            [self.containerView bringSubviewToFront:self.route.descView];
            break;
        case none:
            break;
    }
}

- (void) revealHelp:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"reveal help");
    
    switch (self.currentTool)
    {
        case bolt:
            [self.helpViewController setHelpView:bolt];
            break;
        case route:
            [self.helpViewController setHelpView:route];
            break;
        case text:
            [self.helpViewController setHelpView:text];
            break;
        case none:
            break;
    }
    
    self.helpViewController.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [self presentViewController:self.helpViewController animated:YES completion:^{}];
}

@end