//
//  LifeCycleFirstViewController.m
//  LifeCycle
//
//  Created by Tim Whitaker on 2/14/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "LifeCycleEvent.h"
#import "LifeCycleEventList.h"
#import "LifeCycleFirstViewController.h"

@interface LifeCycleFirstViewController ()
@property (nonatomic, strong) LifeCycleEventList *list;
@end

@implementation LifeCycleFirstViewController

- (LifeCycleEventList *) list
{
    if(!_list)
    {
        _list = [[LifeCycleEventList alloc] init];
    }
    return _list;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib
    
    [self.list addEventWithName:@"viewDidLoad"];
    [self update];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated
{
    [self.list addEventWithName:@"viewDidAppear"];
    [self update];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [self.list addEventWithName:@"viewDidDisappear"];
    [self update];
}

- (void) viewDidLayoutSubviews
{
    [self.list addEventWithName:@"viewDidLayoutSubviews"];
    [self update];
}

- (IBAction)clear:(UIButton *)sender
{
    [self.list clearEvents];
    [self update];
}

- (void) update
{
    NSString *text = @"";
    for (LifeCycleEvent *event in [self.list allEvents])
    {
        text = [text stringByAppendingFormat:@"%@: %@\n", event.date, event.name];
    
    }
    self.lifeCycleList.text = text;
}


@end
