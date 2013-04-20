//
//  FavoritesManager.m
//  Chart Toppers
//
//  Created by Tim Whitaker on 4/15/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "FavoritesManager.h"

@interface FavoritesManager ()

@property (nonatomic, strong) NSMutableSet *set;

@end

@implementation FavoritesManager

- (NSMutableSet *) set
{
    if (!_set)
    {
        _set = [[NSMutableSet alloc] init];
    }
    return _set;
}

- (void)addFavorite:(ITunesMediaItem *)mediaItem
{
    [self.set addObject:mediaItem];
    
//    NSString *path = @"~/Documents/data";
//    path = [path stringByExpandingTildeInPath];
    
//    [NSKeyedArchiver archiveRootObject:[[FavoritesManager sharedFavoritesManager] set] toFile:path];
}

- (void)removeFavorite:(ITunesMediaItem *)mediaItem
{
    [self.set removeObject:mediaItem];
    
//    NSString *path = @"~/Documents/data";
//    path = [path stringByExpandingTildeInPath];
    
//    [NSKeyedArchiver archiveRootObject:[[FavoritesManager sharedFavoritesManager] set] toFile:path];
}

- (BOOL)isFavorite:(ITunesMediaItem *)mediaItem
{
    return [self.set containsObject:mediaItem];
}

- (NSArray *) allFavorites
{
    if (self.set==nil)
    {
        NSMutableSet *set = [NSKeyedUnarchiver unarchiveObjectWithFile:@"favorites"];
        return [set allObjects];
    }
    else
    {
        return [self.set allObjects];
    }
}

+ (FavoritesManager *)sharedFavoritesManager
{
    static FavoritesManager *sharedFavoritesManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedFavoritesManager = [[FavoritesManager alloc] init];
    });
    
    return sharedFavoritesManager;
}

@end
