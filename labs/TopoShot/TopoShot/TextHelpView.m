//
//  TextHelpView.m
//  TopoShot
//
//  Created by Tim Whitaker on 5/4/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "TextHelpView.h"

@implementation TextHelpView

- (id) init
{
    self = [super init];
    if (self)
    {
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(15, 195, 55, 30)];
        UITextView *desc  = [[UITextView alloc] initWithFrame:CGRectMake(90, 200, 220, 250)];
        
        title.text = @"Text:";
        desc.text = @"The text tool is useful for denoting little helpful tidbits of information about a route. Some example situations could be to warn people that a particular flake or rock is really loose, and would be unwise to use. It could also be used to give gear recomendations for trad routes, or giving information on natural anchors if bolted anchors aren't available.\r\rTo add text to the topo, simply tap where you would like a text box, and type what you want to say. To delete a text box double tap on it.";
        
        desc.editable = NO;
        
        [self addSubview:title];
        [self addSubview:desc];
        
        [self setBackgroundColor:[UIColor whiteColor]];
        
    }
    return self;
}

@end
