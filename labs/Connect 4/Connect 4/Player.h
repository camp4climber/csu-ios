//
//  Player.h
//  Connect 4
//
//  Created by Tim Whitaker on 4/18/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, strong) UIColor *pieceColor;

- (Player *) initWithColor:(UIColor *)color;

@end
