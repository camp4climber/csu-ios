//
//  Entry.m
//  ClimbingFeed
//
//  Created by Tim Whitaker on 5/7/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "Entry.h"

@implementation Entry

- (id)initWithJsonAttributes:(NSDictionary *)jsonAttributes
{
    self = [super init];
    
    if (self)
    {
        _title = jsonAttributes[@"title"];
        _author = jsonAttributes[@"author"];
        _url = [[NSURL alloc] initWithString:jsonAttributes[@"url"]];
    }
    return self;
}

@end
