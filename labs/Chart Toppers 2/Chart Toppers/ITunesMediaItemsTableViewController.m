//
//  ITunesMediaItemsTableViewController.m
//  Chart Toppers
//
//  Created by Tim Whitaker on 3/23/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "ITunesMediaItemsTableViewController.h"
#import "ITunesMediaItemDetailViewController.h"
#import "ITunesMediaItem.h"
#import "ITunesMediaItemTableViewCell.h"

@interface ITunesMediaItemsTableViewController ()

@property (nonatomic, strong) NSArray *mediaThings;

@end

@implementation ITunesMediaItemsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    [refresh addTarget:self action:@selector(dragToRefresh:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refresh;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.mediaThings count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ITunesMediaItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    ITunesMediaItem *item = self.mediaThings[indexPath.item];
    
    // Configure the cell...
    cell.titleLabel.text = [NSString stringWithFormat:@"%@", item.title];
    cell.subTitleLabel.text = [NSString stringWithFormat:@"%@", item.artist];
    cell.rankLabel.text = [NSString stringWithFormat:@"%i", item.rank];
    cell.previewImage.image = item.artworkImage;
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ITunesMediaItemDetailViewController *detailController = segue.destinationViewController;
    
    UITableViewCell *cell = (UITableViewCell*)sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    ITunesMediaItem *item = self.mediaThings[indexPath.item];
    
    detailController.item = item;
}

- (void) dragToRefresh:(UIRefreshControl *)refreshControl
{
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Updating..."];
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}

@end
