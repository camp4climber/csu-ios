//
//  ItemsTableViewController.h
//  Listy
//
//  Created by Chris Morris on 3/28/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "List.h"
#import "Item.h"
#import "TextFieldViewController.h"

@interface ItemsTableViewController : UITableViewController <TextFieldViewControllerDelegate>

@property (nonatomic, strong) List *list;
- (void)swipeDelete:(UISwipeGestureRecognizer *)sender;

@end
