//
//  TestDraw.h
//  TopoShot
//
//  Created by Tim Whitaker on 4/24/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface TestDraw : UIView {
@private
    CGPoint currentPoint;
    CGPoint previousPoint1;
    CGPoint previousPoint2;
    CGFloat lineWidth;
    UIColor *lineColor;
    UIImage *curImage;
    
	CGMutablePathRef path;
}

@property (nonatomic, retain) UIColor *lineColor;
@property (readwrite) CGFloat lineWidth;
@property (assign, nonatomic) BOOL empty;

@end