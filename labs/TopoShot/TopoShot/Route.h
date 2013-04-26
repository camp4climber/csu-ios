//
//  Route.h
//  TopoShot
//
//  Created by Tim Whitaker on 3/29/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RouteView.h"

@interface Route : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *difficulty;
@property (strong, nonatomic) NSString *notes;
@property (strong, nonatomic) UIView *boltView;
@property (strong, nonatomic) UIView *descView;
@property (strong, nonatomic) RouteView *routeView;
@property (strong, nonatomic) UIImageView *baseImageView;
@property (strong, nonatomic) UIImage *compiledImage;
@property (strong, nonatomic) UIImage *baseImage;

@end
