//
//  BooksTableViewController.m
//  Chart Toppers
//
//  Created by Tim Whitaker on 3/28/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "BooksTableViewController.h"
#import "ITunesFetcher.h"

@interface BooksTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *mediaThings;

@end

@implementation BooksTableViewController

- (NSArray *) mediaThings
{
    if (!_mediaThings) {
        _mediaThings = [ITunesFetcher topBooks];
    }
    return _mediaThings;
}

@end
