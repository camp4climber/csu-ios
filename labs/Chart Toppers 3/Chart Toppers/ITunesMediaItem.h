//
//  ITunesMediaItem.h
//  Chart Toppers
//
//  Created by Tim Whitaker on 3/23/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITunesMediaItem : NSObject

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *category;
@property (nonatomic, readonly) NSString *artist;
@property (nonatomic, readonly) NSString *releaseDate;
@property (nonatomic, readonly) NSString *price;
@property (nonatomic, readonly) NSURL *artworkURL;
@property (nonatomic, readonly) UIImage *artworkImage;
@property (nonatomic, readonly) NSURL *storeURL;
@property (nonatomic, readonly) NSString *summary;
@property (nonatomic, readonly) UIImage *faveImage;
@property (nonatomic) int rank;

- (id)initWithJsonAttributes:(NSDictionary *)jsonAttributes rank:(int)rank;

@end
