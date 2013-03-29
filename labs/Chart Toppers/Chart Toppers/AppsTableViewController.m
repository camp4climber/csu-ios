//
//  AppsTableViewController.m
//  Chart Toppers
//
//  Created by Tim Whitaker on 3/28/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "AppsTableViewController.h"
#import "ITunesFetcher.h"

@interface AppsTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *mediaThings;

@end

@implementation AppsTableViewController

- (NSArray *) mediaThings
{
    if (!_mediaThings) {
        _mediaThings = [ITunesFetcher topApps];
    }
    return _mediaThings;
}

@end
