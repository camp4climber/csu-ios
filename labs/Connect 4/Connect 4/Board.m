//
//  Board.m
//  Connect 4
//
//  Created by Tim Whitaker on 4/18/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "Board.h"

#define COLUMN_NUMBER 7
#define ROW_NUMBER 6

@implementation Board

- (NSArray *) boardArray
{
    if (!_boardArray)
    {
        NSMutableArray *columns = [[NSMutableArray alloc] initWithCapacity:COLUMN_NUMBER];
        
        for (int i=0; i < ROW_NUMBER; i++)
        {
            [columns addObject:nil];
        }

        _boardArray = [[NSArray alloc] initWithArray:columns];
    }
    return _boardArray;
}

@end
