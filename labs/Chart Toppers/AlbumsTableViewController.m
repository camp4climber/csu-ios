//
//  AlbumsTableViewController.m
//  Chart Toppers
//
//  Created by Tim Whitaker on 3/28/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "AlbumsTableViewController.h"
#import "ITunesFetcher.h"

@interface AlbumsTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *mediaThings;

@end

@implementation AlbumsTableViewController

- (NSArray *) mediaThings
{
    if (!_mediaThings) {
        _mediaThings = [ITunesFetcher topAlbums];
    }
    return _mediaThings;
}

@end
