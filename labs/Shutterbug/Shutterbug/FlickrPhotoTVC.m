//
//  FlickrPhotoTVC.m
//  Shutterbug
//
//  Created by Tim Whitaker on 3/7/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "FlickrPhotoTVC.h"
#import "FlickrFetcher.h"
#import "ImageViewController.h"

@interface FlickrPhotoTVC ()

@end

@implementation FlickrPhotoTVC

- (void) setPhotos:(NSArray *)photos
{
    _photos = photos;
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.photos count];
}

- (NSString *) titleForRow:(NSUInteger)row
{
    return [self.photos[row][FLICKR_PHOTO_TITLE] description];
}

- (NSString *) subtitleForRow:(NSUInteger)row
{
    return [self.photos[row][FLICKR_PHOTO_OWNER] description];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"flickrPhoto";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self titleForRow:indexPath.row];
    cell.detailTextLabel.text = [self subtitleForRow:indexPath.row];
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ImageViewController *imageVC = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    NSURL *url = [FlickrFetcher urlForPhoto:self.photos[indexPath.row] format:FlickrPhotoFormatLarge];
    
    imageVC.imageURL = url;
}

@end
