//
//  TheCounterViewController.m
//  TheCounter
//
//  Created by Tim Whitaker on 2/7/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "TheCounterViewController.h"

@interface TheCounterViewController ()

@end

@implementation TheCounterViewController

- (Counter *) byOneCounter
{
    if (!_byOneCounter)
    {
        _byOneCounter = [[Counter alloc] init];
    }
    return _byOneCounter;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)incrementTapped:(UIButton *)sender
{
    NSLog(@"increment");
    
    [self.byOneCounter increment];
    [self update];
}

- (IBAction)decrementTapped:(UIButton *)sender
{
    NSLog(@"decrement");
    
    [self.byOneCounter decrement];
    [self update];
}

- (void) update
{
    self.oneX.text = [NSString stringWithFormat:@"%d", self.byOneCounter.currentCount];
}

@end
