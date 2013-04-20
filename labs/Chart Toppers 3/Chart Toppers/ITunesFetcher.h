//
//  ITunesFetcher.h
//  Chart Toppers
//
//  Created by Tim Whitaker on 3/23/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITunesMediaItem.h"

@interface ITunesFetcher : NSObject

+ (NSArray *) topApps;
+ (NSArray *) topAlbums;
+ (NSArray *) topBooks;
+ (NSArray *) topMovies;
+ (NSArray *) topTV;
+ (NSArray *) topITunesU;
+ (BOOL) isNetworkAvailable;
@end
