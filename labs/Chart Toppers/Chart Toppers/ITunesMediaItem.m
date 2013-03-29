//
//  ITunesMediaItem.m
//  Chart Toppers
//
//  Created by Tim Whitaker on 3/23/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "ITunesMediaItem.h"

@implementation ITunesMediaItem

- (id)initWithJsonAttributes:(NSDictionary *)jsonAttributes rank:(int)rank
{
    self = [super init];
    NSData *data;
    if (self)
    {
        _title = jsonAttributes[@"im:name"][@"label"];
        _category = jsonAttributes[@"category"][@"attributes"][@"label"];
        _artist = jsonAttributes[@"im:artist"][@"label"];
        _releaseDate = jsonAttributes[@"im:releaseDate"][@"attributes"][@"label"];
        _price = jsonAttributes[@"im:price"][@"label"];
        _artworkURL = [NSURL URLWithString:jsonAttributes[@"im:image"][2][@"label"]];
        data = [NSData dataWithContentsOfURL:self.artworkURL];
        _artworkImage = [[UIImage alloc] initWithData:data];
        _storeURL = jsonAttributes[@"id"][@"label"];
        _rank = rank;
    }
    return self;
}

@end
