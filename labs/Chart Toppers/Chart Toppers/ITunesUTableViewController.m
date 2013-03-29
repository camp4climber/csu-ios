//
//  ITunesUTableViewController.m
//  Chart Toppers
//
//  Created by Tim Whitaker on 3/28/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "ITunesUTableViewController.h"
#import "ITunesFetcher.h"

@interface ITunesUTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *mediaThings;

@end

@implementation ITunesUTableViewController

- (NSArray *) mediaThings
{
    if (!_mediaThings) {
        _mediaThings = [ITunesFetcher topITunesU];
    }
    return _mediaThings;
}

@end
