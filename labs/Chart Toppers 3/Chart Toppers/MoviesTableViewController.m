//
//  MoviesTableViewController.m
//  Chart Toppers
//
//  Created by Tim Whitaker on 3/28/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "MoviesTableViewController.h"
#import "ITunesFetcher.h"
#import "NetworkActivityHelper.h"

@interface MoviesTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *mediaThings;

@end

@implementation MoviesTableViewController

- (NSArray *) mediaThings
{
    dispatch_queue_t q = dispatch_queue_create("Movie Fetch", NULL);
    
    if (!_mediaThings)
    {
        dispatch_async(q, ^{
            [[NetworkActivityHelper sharedInstance] showActivityIndicator];
            _mediaThings = [ITunesFetcher topMovies];
            [NSThread sleepForTimeInterval:drand48() * 3.0];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (_mediaThings == nil)
                {
                    [self presentAlertView];
                }
                else
                {
                    [[NetworkActivityHelper sharedInstance] hideActivityIndicator];
                    [self.tableView reloadData];
                }
            });
        });
    }
    return _mediaThings;
}


@end
