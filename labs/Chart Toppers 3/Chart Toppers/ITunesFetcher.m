//
//  ITunesFetcher.m
//  Chart Toppers
//
//  Created by Tim Whitaker on 3/23/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "ITunesFetcher.h"

@implementation ITunesFetcher

+ (NSArray *) topApps
{
    NSArray *apps;
    NSMutableArray *mediaItemsArray = [[NSMutableArray alloc] init];
    NSError *error;
    NSURL *url = [[NSURL alloc] initWithString:@"https://itunes.apple.com/us/rss/topfreeapplications/limit=50/json"];
    NSData *raw = [[NSData alloc] initWithContentsOfURL:url];
    NSDictionary *parsedJSON = [NSJSONSerialization JSONObjectWithData:raw options:0 error:&error];
    
    if (error)
    {
        NSLog(@"JSON Error: %@", error);
    }
    
    apps = [parsedJSON[@"feed"] objectForKey:@"entry"];
    
    for (int i=0; i < [apps count]; i++)
    {
        ITunesMediaItem *item = [[ITunesMediaItem alloc] initWithJsonAttributes:apps[i] rank:i+1];
        [mediaItemsArray addObject:item];
    }
    
    return [mediaItemsArray copy];
}

+ (NSArray *) topAlbums
{
    NSArray *albums;
    NSMutableArray *mediaItemsArray = [[NSMutableArray alloc] init];
    NSError *error;
    NSURL *url = [[NSURL alloc] initWithString:@"https://itunes.apple.com/us/rss/topalbums/limit=50/json"];
    NSData *raw = [[NSData alloc] initWithContentsOfURL:url];
    NSDictionary *parsedJSON = [NSJSONSerialization JSONObjectWithData:raw options:0 error:&error];
    
    if (error)
    {
        NSLog(@"JSON Error: %@", error);
    }
    
    albums = [parsedJSON[@"feed"] objectForKey:@"entry"];
    
    for (int i=0; i < [albums count]; i++)
    {
        ITunesMediaItem *item = [[ITunesMediaItem alloc] initWithJsonAttributes:albums[i] rank:i+1];
        [mediaItemsArray addObject:item];
    }
    
    return [mediaItemsArray copy];
}

+ (NSArray *) topBooks
{
    NSArray *books;
    NSMutableArray *mediaItemsArray = [[NSMutableArray alloc] init];
    NSError *error;
    NSURL *url = [[NSURL alloc] initWithString:@"https://itunes.apple.com/us/rss/topfreeebooks/limit=50/json"];
    NSData *raw = [[NSData alloc] initWithContentsOfURL:url];
    NSDictionary *parsedJSON = [NSJSONSerialization JSONObjectWithData:raw options:0 error:&error];
    
    if (error)
    {
        NSLog(@"JSON Error: %@", error);
    }
    
    books = [parsedJSON[@"feed"] objectForKey:@"entry"];
    
    for (int i=0; i < [books count]; i++)
    {
        ITunesMediaItem *item = [[ITunesMediaItem alloc] initWithJsonAttributes:books[i] rank:i+1];
        [mediaItemsArray addObject:item];
    }
    
    return [mediaItemsArray copy];
}

+ (NSArray *) topMovies
{
    NSArray *movies;
    NSMutableArray *mediaItemsArray = [[NSMutableArray alloc] init];
    NSError *error;
    NSURL *url = [[NSURL alloc] initWithString:@"https://itunes.apple.com/us/rss/topmovies/limit=50/json"];
    NSData *raw = [[NSData alloc] initWithContentsOfURL:url];
    NSDictionary *parsedJSON = [NSJSONSerialization JSONObjectWithData:raw options:0 error:&error];
    
    if (error)
    {
        NSLog(@"JSON Error: %@", error);
    }
    
    movies = [parsedJSON[@"feed"] objectForKey:@"entry"];
    
    for (int i=0; i < [movies count]; i++)
    {
        ITunesMediaItem *item = [[ITunesMediaItem alloc] initWithJsonAttributes:movies[i] rank:i+1];
        [mediaItemsArray addObject:item];
    }
    
    return [mediaItemsArray copy];
}

+ (NSArray *) topTV
{
    NSArray *tv;
    NSMutableArray *mediaItemsArray = [[NSMutableArray alloc] init];
    NSError *error;
    NSURL *url = [[NSURL alloc] initWithString:@"https://itunes.apple.com/us/rss/toptvepisodes/limit=50/json"];
    NSData *raw = [[NSData alloc] initWithContentsOfURL:url];
    NSDictionary *parsedJSON = [NSJSONSerialization JSONObjectWithData:raw options:0 error:&error];
    
    if (error)
    {
        NSLog(@"JSON Error: %@", error);
    }
    
    tv = [parsedJSON[@"feed"] objectForKey:@"entry"];
    
    for (int i=0; i < [tv count]; i++)
    {
        ITunesMediaItem *item = [[ITunesMediaItem alloc] initWithJsonAttributes:tv[i] rank:i+1];
        [mediaItemsArray addObject:item];
    }
    
    return [mediaItemsArray copy];
}

+ (NSArray *) topITunesU
{
    NSArray *courses;
    NSMutableArray *mediaItemsArray = [[NSMutableArray alloc] init];
    NSError *error;
    NSURL *url = [[NSURL alloc] initWithString:@"https://itunes.apple.com/us/rss/topitunesucourses/limit=50/json"];
    NSData *raw = [[NSData alloc] initWithContentsOfURL:url];
    NSDictionary *parsedJSON = [NSJSONSerialization JSONObjectWithData:raw options:0 error:&error];
    
    if (error)
    {
        NSLog(@"JSON Error: %@", error);
    }
    
    courses = [parsedJSON[@"feed"] objectForKey:@"entry"];
    
    for (int i=0; i < [courses count]; i++)
    {
        ITunesMediaItem *item = [[ITunesMediaItem alloc] initWithJsonAttributes:courses[i] rank:i+1];
        [mediaItemsArray addObject:item];
    }
    
    return [mediaItemsArray copy];
}

@end
