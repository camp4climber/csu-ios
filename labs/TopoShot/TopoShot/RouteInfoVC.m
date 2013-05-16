//
//  RouteInfoVC.m
//  TopoShot
//
//  Created by Tim Whitaker on 5/15/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "RouteInfoVC.h"

@interface RouteInfoVC ()

@end

@implementation RouteInfoVC

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    self.nameLabel.text = self.route.name;
    self.difficultyLabel.text = self.route.difficulty;
    self.notesTextView.text = self.route.notes;
}

@end
