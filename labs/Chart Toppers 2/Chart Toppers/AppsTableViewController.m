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
    dispatch_queue_t q = dispatch_queue_create("App Fetch", NULL);
    
    dispatch_async(q, ^{
        if (!_mediaThings)
        {
            _mediaThings = [ITunesFetcher topApps];
            [NSThread sleepForTimeInterval:drand48() * 3.0];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
    return _mediaThings;
}


@end
