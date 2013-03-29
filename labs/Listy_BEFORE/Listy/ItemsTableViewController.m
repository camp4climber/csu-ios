//
//  ItemsTableViewController.m
//  Listy
//
//  Created by Chris Morris on 3/28/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "ItemsTableViewController.h"
#import "ItemTableViewCell.h"

@interface ItemsTableViewController ()

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSManagedObjectContext     *managedObjectContext;
@property (nonatomic, strong) Item                       *activeItem;

@end

@implementation ItemsTableViewController


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self refreshItems];
}

- (void)refreshItems
{
    if (!self.list) {
        return;
    }

    NSError *error;

    [self.fetchedResultsController performFetch:&error];

    if (error) {
        NSLog(@"ERROR: Something went wrong in our fetching.");
    }
    else {
        [self.tableView reloadData];
    }
}


- (void)setList:(List *)list
{
    _list = list;

    if (list) {
        self.managedObjectContext = list.managedObjectContext;

    }
    else {
        self.managedObjectContext = nil;
    }
}



- (void)setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    _managedObjectContext = managedObjectContext;

    if (managedObjectContext) {
        NSFetchRequest *fetchRequest;

        fetchRequest                 = [NSFetchRequest fetchRequestWithEntityName:@"Item"];
        fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"title"
                                                                       ascending:YES
                                                                        selector:@selector(localizedCaseInsensitiveCompare:)]];
        fetchRequest.predicate       = [NSPredicate predicateWithFormat:@"list = %@", self.list];


        self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                            managedObjectContext:managedObjectContext
                                                                              sectionNameKeyPath:nil
                                                                                       cacheName:nil];
    } else {
        self.fetchedResultsController = nil;
    }
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Item Cell"];

    Item            *item = [self.fetchedResultsController objectAtIndexPath:indexPath];

    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDelete:)];
    [swipe setDirection:UISwipeGestureRecognizerDirectionRight];
    [cell addGestureRecognizer:swipe];
    
    cell.textLabel.text = item.title;

    return cell;
}

- (IBAction)addItemTapped
{
    Item *newItem = [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:self.managedObjectContext];

    newItem.title = @"Untitled Item";
    newItem.list  = self.list;

    [self refreshItems];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];

    self.activeItem = [self.fetchedResultsController objectAtIndexPath:indexPath];

    if ([segue.identifier isEqualToString:@"Edit Item"]) {
        TextFieldViewController *textFieldViewController = segue.destinationViewController;

        textFieldViewController.text     = self.activeItem.title;
        textFieldViewController.delegate = self;
    }
}

#pragma mark - TextFieldViewControllerDelegate
- (void)textFieldViewControllerDidComplete:(TextFieldViewController *)controller
{
    self.activeItem.title = controller.text;

    [self.navigationController popViewControllerAnimated:YES];
}


- (void)swipeDelete:(UISwipeGestureRecognizer *)sender {
    CGPoint location = [sender locationInView:self.tableView];
    
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    Item *fuck = [self.fetchedResultsController objectAtIndexPath:indexPath];
    

    [self.managedObjectContext deleteObject:fuck];
    [self.tableView reloadData];
    [self refreshItems];
}
@end
