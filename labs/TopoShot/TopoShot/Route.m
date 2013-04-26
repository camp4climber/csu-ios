//
//  Route.m
//  TopoShot
//
//  Created by Tim Whitaker on 3/29/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "Route.h"

@implementation Route

- (NSString *) name
{
    if (!_name)
    {
        _name = [[NSString alloc] init];
    }
    return _name;
}

- (NSString *) difficulty
{
    if (!_difficulty)
    {
        _difficulty = [[NSString alloc] init];
    }
    return _difficulty;
}

- (NSString *) notes
{
    if (!_notes)
    {
        _notes = [[NSString alloc] init];
    }
    return _notes;
}

- (UIView *) boltView
{
    if (!_boltView)
    {
        _boltView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _boltView;
}

- (UIView *) descView
{
    if (!_descView)
    {
        _descView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _descView;
}

- (RouteView *) routeView
{
    if (!_routeView)
    {
        _routeView = [[RouteView alloc] initWithFrame:CGRectZero];
    }
    return _routeView;
}

- (UIImageView *) baseImageView
{
    if (!_baseImageView)
    {
        _baseImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _baseImageView;
}

- (UIImage *) compiledImage
{
    if (!_compiledImage)
    {
        _compiledImage = [[UIImage alloc] init];
    }
    return _compiledImage;
}

- (UIImage *) baseImage
{
    if (!_baseImage)
    {
        _baseImage = [[UIImage alloc] init];
    }
    return _baseImage;
}

@end
