//
//  EntryTVC.m
//  ClimbingFeed
//
//  Created by Tim Whitaker on 5/7/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "EntryTVC.h"
#import "FeedFetcher.h"
#import "NetworkActivityHelper.h"
#import "Entry.h"
#import "WebVC.h"

@interface EntryTVC ()

@property (nonatomic, strong) NSArray *entries;

@end

@implementation EntryTVC

- (void) viewDidLoad
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.entries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Entry *entry = self.entries[indexPath.item];
    
    cell.textLabel.text = entry.title;
    cell.detailTextLabel.text = entry.author;
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebVC *vc = segue.destinationViewController;
    
    UITableViewCell *cell = (UITableViewCell*)sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    Entry *entry = self.entries[indexPath.item];
    vc.entry = entry;
}

- (NSArray *) entries
{
    dispatch_queue_t q = dispatch_queue_create("Feed Fetch", NULL);
    
    if (!_entries)
    {
        dispatch_async(q, ^{
            [[NetworkActivityHelper sharedInstance] showActivityIndicator];
            _entries = [FeedFetcher allEntries];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (_entries == nil)
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
    return _entries;
}

- (void) presentAlertView
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Network Error" message:@"A network connection cannot be detected. Please confirm that you have an active connection and try again." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    
    [alert show];
}

@end
