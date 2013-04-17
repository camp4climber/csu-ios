//
//  UIView+findFirstResponder.m
//  TopoShot
//
//  Created by Tim Whitaker on 4/15/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "UIView+findFirstResponder.h"

@implementation UIView (findFirstResponder)

- (UIView *)findFirstResponder
{
    if (self.isFirstResponder) {
        return self;
    }
    
    for (UIView *subView in self.subviews) {
        UIView *firstResponder = [subView findFirstResponder];
        
        if (firstResponder != nil) {
            return firstResponder;
        }
    }
    
    return nil;
}

@end
