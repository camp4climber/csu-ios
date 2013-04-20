//
//  FavoritesTableViewController.m
//  Chart Toppers
//
//  Created by Tim Whitaker on 4/19/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "FavoritesTableViewController.h"
#import "FavoritesManager.h"
#import "FavoriteTableViewCell.h"
#import "ITunesMediaItemDetailViewController.h"

@interface FavoritesTableViewController ()

@end

@implementation FavoritesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    NSString *path = @"~/Documents/data";
//    path = [path stringByExpandingTildeInPath];
    
//    NSMutableSet *set;
//   set = [NSKeyedUnarchiver unarchiveObjectWithFile:path];

//    for (ITunesMediaItem *item in [set allObjects])
//    {
//        [[FavoritesManager sharedFavoritesManager] addFavorite:item];
//   }
}

- (void) viewDidAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[FavoritesManager sharedFavoritesManager] allFavorites] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    FavoriteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    ITunesMediaItem *item = [[[FavoritesManager sharedFavoritesManager] allFavorites] objectAtIndex:indexPath.item];
    
    cell.titleLabel.text = item.title;
    cell.subtitleLabel.text = item.artist;
    
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    FavoriteTableViewCell *comeOn = (FavoriteTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    indicatorView.center = comeOn.previewImage.center;
    indicatorView.hidesWhenStopped = YES;
    [self.view addSubview:indicatorView];
    [indicatorView startAnimating];
    
    dispatch_queue_t q = dispatch_queue_create("getImage", NULL);
    
    dispatch_async(q, ^{
        [NSThread sleepForTimeInterval:drand48() * 3.0];
        UIImage *artIMG = item.artworkImage;
        dispatch_async(dispatch_get_main_queue(), ^{
            FavoriteTableViewCell *tableCell = (FavoriteTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
            tableCell.previewImage.image = artIMG;
            [indicatorView stopAnimating];
        });
    });
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ITunesMediaItemDetailViewController *detailController = segue.destinationViewController;
    
    UITableViewCell *cell = (UITableViewCell*)sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    ITunesMediaItem *item = [[[FavoritesManager sharedFavoritesManager] allFavorites] objectAtIndex:indexPath.item];
    
    detailController.item = item;
}

@end
