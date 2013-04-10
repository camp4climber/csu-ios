//
//  Ballpark.m
//  BatterUp
//
//  Created by Chris Morris on 4/4/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "Ballpark.h"
#import <CoreLocation/CoreLocation.h>

@interface Ballpark ()

@end

@implementation Ballpark

+ (NSArray *)allBallparks
{
    static NSArray *allBallparks;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString       *sourcePath       = [[NSBundle mainBundle] pathForResource:@"ballparks"
                                                                           ofType:@"plist"];
        NSArray        *rawBallparks     = [[NSArray alloc] initWithContentsOfFile:sourcePath];
        NSMutableArray *workingBallparks = [[NSMutableArray alloc] init];

        for (NSDictionary *ballparkAttributes in rawBallparks) {
            Ballpark *ballpark = [[Ballpark alloc] init];

            ballpark.teamName    =  [ballparkAttributes objectForKey:@"team"     ];
            ballpark.stadiumName =  [ballparkAttributes objectForKey:@"stadium"  ];
            ballpark.city        =  [ballparkAttributes objectForKey:@"city"     ];
            ballpark.state       =  [ballparkAttributes objectForKey:@"state"    ];
            ballpark.address     =  [ballparkAttributes objectForKey:@"address"  ];
            ballpark.logoName    =  [ballparkAttributes objectForKey:@"icon"     ];
            ballpark.capacity    =  [[ballparkAttributes objectForKey:@"capacity" ] unsignedIntegerValue];
            ballpark.latitude    =  [[ballparkAttributes objectForKey:@"latitude" ] doubleValue         ];
            ballpark.longitude   =  [[ballparkAttributes objectForKey:@"longitude"] doubleValue         ];
            [workingBallparks addObject:ballpark];
        }

        allBallparks = [workingBallparks copy];
    });

    return allBallparks;
}

- (CLLocationCoordinate2D) coordinate
{
    return CLLocationCoordinate2DMake(self.latitude, self.longitude);
}

- (NSString *)title
{
    return self.teamName;
}

- (NSString *) subtitle
{
    return self.stadiumName;
}

@end
