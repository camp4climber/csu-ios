//
//  PhotoLibrary.m
//  PhotoPicker
//
//  Created by Tim Whitaker on 3/5/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "PhotoLibrary.h"

@implementation PhotoLibrary

- (id) init
{
    self = [super init];
    if (self)
    {
        NSString *errorMsg = nil;
        NSPropertyListFormat format;
        NSString *plistPath;
        NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        plistPath = [rootPath stringByAppendingPathComponent:@"Photos.plist"];
        if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath])
        {
            plistPath = [[NSBundle mainBundle] pathForResource:@"Photos" ofType:@"plist"];
        }
        NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
        NSDictionary *tmp = (NSDictionary *)[NSPropertyListSerialization propertyListFromData:plistXML mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorMsg];
        if (!tmp)
        {
            NSLog(@"Error reading plist. %@, format: %d", errorMsg, format);
        }
       // self.photos = [NSMutableArray arrayWithArray:[tmp objectForKey:@"Climbing"]];
        self.photos = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
        self.currentCategory = [[self.photos allKeys] objectAtIndex:0];
    }
    return self;
}

- (NSUInteger) numberOfCategories
{
    return [[self.photos allKeys] count];
}

- (NSString *) nameForCategory:(NSUInteger)category
{
    return self.currentCategory;
}

- (NSUInteger) numberOfPhotosInCategory
{
    NSArray *photos;
    photos = [self.photos objectForKey:self.currentCategory];
    return photos.count;
}

- (NSString *) nameForPhotoAtPosition:(NSUInteger)position
{
    NSArray *photos = [[self.photos objectForKey:self.currentCategory] allKeys];
    NSString *name = [photos objectAtIndex:position];
    return name;
}

- (UIImage *) imageForPhotoAtPosition:(NSUInteger)position
{
    NSArray *photos = [[self.photos objectForKey:self.currentCategory] allValues];
    NSString *name = [photos objectAtIndex:position];
    UIImage *image = [UIImage imageNamed:name];
    return image;
}

@end
