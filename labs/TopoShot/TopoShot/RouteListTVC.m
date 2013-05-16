//
//  RouteListTVC.m
//  TopoShot
//
//  Created by Tim Whitaker on 3/29/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "RouteListTVC.h"
#import "RouteList.h"
#import "Route.h"
#import "RouteTableViewCell.h"
#import "RouteVC.h"

@interface RouteListTVC ()

@end

@implementation RouteListTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[RouteList sharedRouteList] allRoutes] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    RouteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Route *route = [[[RouteList sharedRouteList] allRoutes] objectAtIndex:indexPath.item];
    
    cell.nameLabel.text       = route.name;
    cell.difficultyLabel.text = route.difficulty;
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    RouteVC *vc = segue.destinationViewController;
//    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
//    Route *route = [[[RouteList sharedRouteList] allRoutes] objectAtIndex:indexPath.row];
//    
//    vc.route = route;
}

@end
