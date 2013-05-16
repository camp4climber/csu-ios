//
//  BoltHelpView.m
//  TopoShot
//
//  Created by Tim Whitaker on 5/4/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "BoltHelpView.h"

@implementation BoltHelpView

- (id) init
{
    self = [super init];
    if (self)
    {
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(15, 195, 55, 30)];
        UITextView *desc  = [[UITextView alloc] initWithFrame:CGRectMake(90, 200, 220, 250)];
        
        title.text = @"Bolts:";
        desc.text = @"In rock climbing, a bolt is a permanent anchor fixed into a hole drilled in the rock as a form of protection. As a climber ascends a sport route, he or she clips quickdraws into a bolt and clips their rope into the quickdraw as they go. Bolts are also often used at the tops of routes called anchors in order to safely complete and retreat off a route.\r\rBolts are notated by an 'X' on a topo overlay. In order to add a bolt, simply tap on the screen. Double tap to remove them.\r\rAnchors are notated by 2 x's side by side 'X X'. Tap with 2 fingers at the same time to add a bolt.";
        
        desc.editable = NO;
        
        [self addSubview:title];
        [self addSubview:desc];
        
        [self setBackgroundColor:[UIColor whiteColor]];
        
    }
    return self;
}

@end
