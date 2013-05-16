//
//  RouteHelpView.m
//  TopoShot
//
//  Created by Tim Whitaker on 5/4/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "RouteHelpView.h"

@implementation RouteHelpView

- (id) init
{
    self = [super init];
    if (self)
    {
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(15, 195, 55, 30)];
        UITextView *desc  = [[UITextView alloc] initWithFrame:CGRectMake(90, 200, 220, 250)];
        
        title.text = @"Route:";
        desc.text = @"The route is where you climb up a wall. This can be slightly different from the direct line the bolts take, as many times you have to lean out to clip a bolt or you have to traverse on holds that aren't necessarily on a direct line from bolt to bolt.\r\r The route can be used to show how boulder problems go as well as traditional routes.\r\rIn order to mark a route on the topo, simply drag your finger along where you want the route to be drawn.";
        
        desc.editable = NO;
        
        [self addSubview:title];
        [self addSubview:desc];
        
        [self setBackgroundColor:[UIColor whiteColor]];
        
    }
    return self;
}

@end
