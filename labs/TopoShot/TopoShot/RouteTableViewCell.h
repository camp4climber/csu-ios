//
//  RouteTableViewCell.h
//  TopoShot
//
//  Created by Tim Whitaker on 4/24/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RouteTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *difficultyLabel;

@end
