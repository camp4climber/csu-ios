//
//  BallparkAnnotationView.m
//  BatterUp
//
//  Created by Tim Whitaker on 4/4/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "BallparkAnnotationView.h"

@implementation BallparkAnnotationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id) initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        NSString *title = [[NSString alloc] initWithFormat:@"%@", annotation.title];
        self.image = [[UIImage alloc] initWithContentsOfFile:title];
    }
    return self;
}

@end
