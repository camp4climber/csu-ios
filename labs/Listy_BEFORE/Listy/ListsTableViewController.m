//
//  ListsTableViewController.m
//  Listy
//
//  Created by Chris Morris on 3/28/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "ListsTableViewController.h"

@interface ListsTableViewController ()

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSManagedObjectContext     *managedObjectContext;
@property (nonatomic, strong) List                       *activeList;

@end

@implementation ListsTableViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self refreshLists];
}

- (void)refreshLists
{
    if (!self.managedObjectContext) {
        [self setupManagedObjectContext];
    }
    else {
        NSError *error;

        [self.fetchedResultsController performFetch:&error];

        if (error) {
            NSLog(@"ERROR: Something went wrong in our fetching.");
        }
        else {
            [self.tableView reloadData];
        }
    }
}

- (void)setupManagedObjectContext
{
    if (self.managedObjectContext) {
        return;
    }
    
    NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];

    url = [url URLByAppendingPathComponent:@"lists"];
    UIManagedDocument *document = [[UIManagedDocument alloc] initWithFileURL:url];

    if (![[NSFileManager defaultManager] fileExistsAtPath:[url path]]) {
        [document saveToURL:url
           forSaveOperation:UIDocumentSaveForCreating
          completionHandler:^(BOOL success) {
              if (success) {
                  self.managedObjectContext = document.managedObjectContext;
              }
          }];
    }
    else if (document.documentState == UIDocumentStateClosed) {
        [document openWithCompletionHandler:^(BOOL success) {
            if (success) {
                self.managedObjectContext = document.managedObjectContext;
                [self refreshLists];
            }
        }];
    }
    else {
        self.managedObjectContext = document.managedObjectContext;
    }
}

- (void)setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    _managedObjectContext = managedObjectContext;

    if (managedObjectContext) {
        NSFetchRequest *fetchRequest;

        fetchRequest                 = [NSFetchRequest fetchRequestWithEntityName:@"List"];
        fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                       ascending:YES
                                                                        selector:@selector(localizedCaseInsensitiveCompare:)]];

        
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

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"List Cell"];

    List            *list = [self.fetchedResultsController objectAtIndexPath:indexPath];

    cell.textLabel.text = list.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d items", [list.items count]];

    return cell;
}

- (IBAction)addListTapped
{
    List *newList = [NSEntityDescription insertNewObjectForEntityForName:@"List" inManagedObjectContext:self.managedObjectContext];

    newList.name  = @"Untitled List";

    [self refreshLists];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];

    self.activeList = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    if ([segue.identifier isEqualToString:@"Edit List"]) {
        TextFieldViewController *textFieldViewController = segue.destinationViewController;

        textFieldViewController.text     = self.activeList.name;
        textFieldViewController.delegate = self;
    }
    else if ([segue.identifier isEqualToString:@"List Items"]) {
        ItemsTableViewController *itemsTableViewController = segue.destinationViewController;

        itemsTableViewController.list = self.activeList;
    }
}

#pragma mark - TextFieldViewControllerDelegate
- (void)textFieldViewControllerDidComplete:(TextFieldViewController *)controller
{
    self.activeList.name = controller.text;

    [self.navigationController popViewControllerAnimated:YES];
}


@end
