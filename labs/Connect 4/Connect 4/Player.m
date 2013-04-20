//
//  Player.m
//  Connect 4
//
//  Created by Tim Whitaker on 4/18/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "Player.h"

@implementation Player

- (Player *) initWithColor:(UIColor *)color
{
    self = [super init];
    
    if (self)
    {
        self.pieceColor = color;
    }
    
    return self;
}

@end
