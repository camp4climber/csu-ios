//
//  ViewController.m
//  Connect 4
//
//  Created by Tim Whitaker on 4/18/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"
#import "Board.h"
#import "Player.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    Board *board = [[Board alloc] init];
    Player *p1   = [[Player alloc] initWithColor:[UIColor blackColor]];
    Player *p2   = [[Player alloc] initWithColor:[UIColor redColor]];
    
}

- (IBAction)dropPiece:(UIButton *)sender
{
    UIView *piece = [[UIView alloc] initWithFrame:CGRectMake(sender.center.x-30, -60, 60, 60)];
    [piece setBackgroundColor:[UIColor blackColor]];
    piece.layer.cornerRadius = 30;
    
    [self.view addSubview:piece];
    
    [UIView animateWithDuration:0.5 animations:^{
        piece.center = CGPointMake(sender.center.x, 260);
    }];
}
@end
