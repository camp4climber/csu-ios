//
//  Board.h
//  Connect 4
//
//  Created by Tim Whitaker on 4/18/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Board : NSObject

@property (nonatomic, strong) NSArray *boardArray;
@property (nonatomic, strong) UIImage *boardImage;

@end
