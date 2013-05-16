//
//  Entry.h
//  ClimbingFeed
//
//  Created by Tim Whitaker on 5/7/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSURL *url;

- (id)initWithJsonAttributes:(NSDictionary *)jsonAttributes;

@end
