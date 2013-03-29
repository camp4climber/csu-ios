//
//  TVTableViewController.m
//  Chart Toppers
//
//  Created by Tim Whitaker on 3/28/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "TVTableViewController.h"
#import "ITunesFetcher.h"

@interface TVTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *mediaThings;

@end

@implementation TVTableViewController

- (NSArray *) mediaThings
{
    if (!_mediaThings) {
        _mediaThings = [ITunesFetcher topTV];
    }
    return _mediaThings;
}

@end