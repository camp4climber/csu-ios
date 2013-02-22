//
//  PolygonView.m
//  Polygon
//
//  Created by Tim Whitaker on 2/21/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "PolygonView.h"

@interface PolygonView ()
-(CGFloat)radius;
@end

@implementation PolygonView

- (CGFloat) radius
{
    return self.bounds.size.width/2;
}

- (void) setNumberOfSides: (NSUInteger)num
{
    if (num < 3)
        _numberOfSides = 3;
    else
        _numberOfSides = num;
    
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *polygonPath = [[UIBezierPath alloc] init];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, self.bounds.size.width/2, self.bounds.size.height/2);
    CGContextRotateCTM(context, -M_PI/2);
    [[UIColor blackColor] setFill];
    
    [polygonPath moveToPoint:CGPointMake([self radius], 0)];
    for (int i = 1; i < self.numberOfSides; i++) {
        CGFloat x = [self radius] *cos(2*M_PI * i/self.numberOfSides);
        CGFloat y = [self radius] *sin(2*M_PI * i/self.numberOfSides);
        
        [polygonPath addLineToPoint:CGPointMake(x, y)];
    }
    
    [polygonPath closePath];
    [polygonPath fill];
    CGContextRestoreGState(context);

}


@end
