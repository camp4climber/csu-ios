//
//  FeedFetcher.m
//  ClimbingFeed
//
//  Created by Tim Whitaker on 5/7/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "FeedFetcher.h"
#import "Entry.h"

@implementation FeedFetcher

+ (NSArray *) allEntries
{
    NSArray *entries;
    NSMutableArray *mutableEntriesArray = [[NSMutableArray alloc] init];
    NSError *error;
    NSURL *url = [[NSURL alloc] initWithString:@"http://tim-whitaker.com/climbingfeed.json"];
    NSData *raw = [[NSData alloc] initWithContentsOfURL:url];
    NSDictionary *parsedJSON = [NSJSONSerialization JSONObjectWithData:raw options:0 error:&error];
        
    if (error)
    {
        NSLog(@"JSON Error: %@", error);
    }
    
    entries = [parsedJSON[@"feed"] objectForKey:@"entries"];
    
    for (int i=0; i < [entries count]; i++)
    {
        Entry *item = [[Entry alloc] initWithJsonAttributes:entries[i]];
        [mutableEntriesArray addObject:item];
    }
    
    return [mutableEntriesArray copy];
}

@end
