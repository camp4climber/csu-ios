//
//  Ballpark.h
//  BatterUp
//
//  Created by Chris Morris on 4/4/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Ballpark : NSObject <MKAnnotation>

@property (nonatomic, copy) NSString   *teamName;
@property (nonatomic, copy) NSString   *stadiumName;
@property (nonatomic, copy) NSString   *city;
@property (nonatomic, copy) NSString   *state;
@property (nonatomic, copy) NSString   *address;
@property (nonatomic, copy) NSString   *logoName;
@property (nonatomic)       NSUInteger  capacity;
@property (nonatomic)       double      latitude;
@property (nonatomic)       double      longitude;

+ (NSArray *)allBallparks;

@end
