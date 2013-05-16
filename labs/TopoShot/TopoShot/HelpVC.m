//
//  HelpVC.m
//  TopoShot
//
//  Created by Tim Whitaker on 5/4/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "HelpVC.h"
#import "BoltHelpView.h"
#import "RouteHelpView.h"
#import "TextHelpView.h"

@interface HelpVC ()

@property (nonatomic, strong) BoltHelpView *boltHelpView;
@property (nonatomic, strong) RouteHelpView *routeHelpView;
@property (nonatomic, strong) TextHelpView *textHelpView;

@end

@implementation HelpVC

- (BoltHelpView *) boltHelpView
{
    if (!_boltHelpView)
    {
        _boltHelpView = [[BoltHelpView alloc] init];
    }
    return _boltHelpView;
}

- (RouteHelpView *) routeHelpView
{
    if (!_routeHelpView)
    {
        _routeHelpView = [[RouteHelpView alloc] init];
    }
    return _routeHelpView;
}

- (TextHelpView *) textHelpView
{
    if (!_textHelpView)
    {
        _textHelpView = [[TextHelpView alloc] init];
    }
    return _textHelpView;
}

- (void) setHelpView: (ButtonType)tool
{
    switch (tool)
    {
        case bolt:
            self.view = self.boltHelpView;
            break;
        case route:
            self.view = self.routeHelpView;
            break;
        case text:
            self.view = self.textHelpView;
            break;
        case none:
            break;
    }
}

@end
