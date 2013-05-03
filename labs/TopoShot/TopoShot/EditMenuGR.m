//
//  EditMenuGR.m
//  TopoShot
//
//  Created by Tim Whitaker on 5/2/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "EditMenuGR.h"

typedef enum State : NSInteger State;
enum State : NSInteger {Began, Changed, Possible, Ended, Canceled, Recognized, Failed};


@interface EditMenuGR ()
@property (nonatomic) ButtonType closestButtonType;
@property (nonatomic) CGPoint origin;
@property (nonatomic) State state;
@property (nonatomic, strong) UIImageView *boltButtonView;
@property (nonatomic, strong) UIImageView *routeButtonView;
@property (nonatomic, strong) UIImageView *textButtonView;
@end

@implementation EditMenuGR

- (UIImageView *) boltButtonView
{
    if (!_boltButtonView)
    {
        UIImage *boltImage = [UIImage imageNamed:@"placeholder.gif"];
        _boltButtonView = [[UIImageView alloc] initWithImage:boltImage];
    }
    return _boltButtonView;
}

- (UIImageView *) routeButtonView
{
    if (!_routeButtonView)
    {
        UIImage *routeImage = [UIImage imageNamed:@"placeholder.gif"];
        _routeButtonView = [[UIImageView alloc] initWithImage:routeImage];
    }
    return _routeButtonView;
}

- (UIImageView *) textButtonView
{
    if (!_textButtonView)
    {
        UIImage *textImage = [UIImage imageNamed:@"placeholder.gif"];
        _textButtonView = [[UIImageView alloc] initWithImage:textImage];
    }
    return _textButtonView;
}

- (void) touchesBegan: (NSSet *)touches withEvent:(UIEvent *)event
{
    //long press
    UITouch *t = [touches anyObject];
    CGPoint pt = [t locationInView:self.view];
    
    self.origin = pt;
    
    self.state = Began;
    
    NSTimeInterval duration = 0.5;
    [self performSelector:@selector(showMenu)
               withObject:nil
               afterDelay:duration];    
}

- (void) touchesMoved: (NSSet *) touches withEvent:(UIEvent *)event
{
    //testing this. assume that touch moves before showMenu is called
    if (self.state == Canceled)
    {
        [NSObject cancelPreviousPerformRequestsWithTarget:self];
    }
    else
    {
        UITouch *t = [touches anyObject];
        CGPoint pt = [t locationInView:self.view];
        
        //find closest button
        UIImageView *closestButton = [self findClosestButtonToFinger:pt];
        
        [self resetNotClosestButtons:closestButton];
        
        //attract closest button to finger
        [self moveClosestButton:closestButton towardsFingerLocation:pt];
        
        self.state = Possible;
        
        if (CGRectContainsPoint(closestButton.frame, pt))
        {
            //finger in button
            [self highlightClosestButton:closestButton];
            self.state = Possible;
        }
        else
        {
            //finger leaves button
            [self reset];
            self.state = Changed;
        }
    }
}

- (void) touchesEnded: (NSSet *) touches withEvent:(UIEvent *)event
{
    UITouch *t = [touches anyObject];
    CGPoint pt = [t locationInView:self.view];
    
    if (self.state == Possible)
    {
        if (CGRectContainsPoint(self.boltButtonView.frame, pt))
        {
            self.chosenButtonType = bolt;
            [self chooseButton:self.boltButtonView];
        }
        else if (CGRectContainsPoint(self.routeButtonView.frame, pt))
        {
            self.chosenButtonType = route;
            [self chooseButton:self.routeButtonView];
        }
        else if (CGRectContainsPoint(self.textButtonView.frame, pt))
        {
            self.chosenButtonType = text;
            [self chooseButton:self.textButtonView];
        }
    }
    else
    {
        [NSObject cancelPreviousPerformRequestsWithTarget:self];
        self.chosenButtonType = none;
        [self hideMenu];
    }
    self.state = Ended;
}

- (void) reset
{
    [UIView animateWithDuration:0.5 animations:^{
        self.boltButtonView.image  = [UIImage imageNamed:@"placeholder.gif"];
        self.routeButtonView.image = [UIImage imageNamed:@"placeholder.gif"];
        self.textButtonView.image  = [UIImage imageNamed:@"placeholder.gif"];
    }];
}

- (void) resetNotClosestButtons: (UIImageView *)button
{
    if (button == self.boltButtonView)
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.routeButtonView.center = CGPointMake(self.origin.x, self.origin.y-97);
            self.textButtonView.center = CGPointMake(self.origin.x+72, self.origin.y-65);
            self.routeButtonView.image = [UIImage imageNamed:@"placeholder.gif"];
            self.textButtonView.image  = [UIImage imageNamed:@"placeholder.gif"];
        }];
    }
    else if (button == self.routeButtonView)
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.boltButtonView.center = CGPointMake(self.origin.x-72, self.origin.y-65);
            self.textButtonView.center = CGPointMake(self.origin.x+72, self.origin.y-65);
            self.boltButtonView.image  = [UIImage imageNamed:@"placeholder.gif"];
            self.textButtonView.image  = [UIImage imageNamed:@"placeholder.gif"];
        }];
    }
    else
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.boltButtonView.center = CGPointMake(self.origin.x-72, self.origin.y-65);
            self.routeButtonView.center = CGPointMake(self.origin.x, self.origin.y-97);
            self.boltButtonView.image  = [UIImage imageNamed:@"placeholder.gif"];
            self.routeButtonView.image = [UIImage imageNamed:@"placeholder.gif"];
        }];
    }
}

- (void) showMenu
{    
    //pythagorean triple
    CGPoint boltButtonLocation = CGPointMake(self.origin.x-72, self.origin.y-65);
    CGPoint routeButtonLocation = CGPointMake(self.origin.x, self.origin.y-97);
    CGPoint textButtonLocation = CGPointMake(self.origin.x+72, self.origin.y-65);
        
    [self.view addSubview:self.boltButtonView];
    [self.view addSubview:self.routeButtonView];
    [self.view addSubview:self.textButtonView];
    
    self.boltButtonView.center = self.origin;
    self.routeButtonView.center = self.origin;
    self.textButtonView.center = self.origin;
    
    // begin button animation
    [UIView animateWithDuration:0.5 animations:^{
        self.boltButtonView.center = boltButtonLocation;
        self.routeButtonView.center = routeButtonLocation;
        self.textButtonView.center = textButtonLocation;
        
        self.boltButtonView.alpha  = 1.0;
        self.routeButtonView.alpha = 1.0;
        self.textButtonView.alpha  = 1.0;
    }];
}

- (void) hideMenu
{
    [UIView animateWithDuration:0.5 animations:^{
        self.boltButtonView.center  = self.origin;
        self.routeButtonView.center = self.origin;
        self.textButtonView.center  = self.origin;
        
        self.boltButtonView.alpha  = 0.0;
        self.routeButtonView.alpha = 0.0;
        self.textButtonView.alpha  = 0.0;
    }];    
}

- (UIImageView *) findClosestButtonToFinger:(CGPoint)pt
{
    CGFloat dx;
    CGFloat dy;
    UIImageView *closestButton;
    
    dx = fabs(self.boltButtonView.center.x-pt.x);
    dy = fabs(self.boltButtonView.center.y-pt.y);
    
    CGFloat distance = sqrt((dx*dx)+(dy*dy));
    CGFloat closestDistance = distance;
    
    closestButton = self.boltButtonView;
    self.closestButtonType = bolt;
    
    dx = fabs(self.routeButtonView.center.x-pt.x);
    dy = fabs(self.routeButtonView.center.y-pt.y);
    
    distance = sqrt((dx*dx)+(dy*dy));
    
    if (distance < closestDistance)
    {
        closestDistance = distance;
        closestButton = self.routeButtonView;
        self.closestButtonType = route;
    }
    
    dx = fabs(self.textButtonView.center.x-pt.x);
    dy = fabs(self.textButtonView.center.y-pt.y);
    
    distance = sqrt((dx*dx)+(dy*dy));
    
    if (distance < closestDistance)
    {
        closestDistance = distance;
        closestButton = self.textButtonView;
        self.closestButtonType = text;
    }
    return closestButton;
}

- (void) moveClosestButton:(UIImageView *)button towardsFingerLocation:(CGPoint) pt
{
    [UIView animateWithDuration:0.5 animations:^{
        if (self.closestButtonType==bolt)
        {
            button.center = CGPointMake(self.origin.x-62, self.origin.y-55);
        }
        else if (self.closestButtonType==route)
        {
            button.center = CGPointMake(self.origin.x, self.origin.y-87);
        }
        else if (self.closestButtonType==text)
        {
            button.center = CGPointMake(self.origin.x+62, self.origin.y-55);
        }
    }];
}

- (void) highlightClosestButton:(UIImageView *)button
{
    [UIView animateWithDuration:0.5 animations:^{
        if (self.closestButtonType==bolt)
        {
            button.image = [UIImage imageNamed:@"bolt_button.gif"];
        }
        else if (self.closestButtonType==route)
        {
            button.image = [UIImage imageNamed:@"route_button.gif"];
        }
        else if (self.closestButtonType==text)
        {
            button.image = [UIImage imageNamed:@"text_button.gif"];
        }
    }];
}

- (void) chooseButton:(UIImageView *)button
{
    [UIView animateWithDuration:0.5 animations:^{
        button.backgroundColor = [UIColor blackColor];
    }];
    [self performSelector:@selector(hideMenu) withObject:nil afterDelay:0.5];
}

@end
