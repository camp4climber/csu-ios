//
//  PhotoLibrary.h
//  PhotoPicker
//
//  Created by Tim Whitaker on 3/5/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoLibrary : NSObject

@property(nonatomic, strong) NSDictionary *photos;
@property(nonatomic, strong) NSString *currentCategory;

- (NSUInteger)numberOfCategories;
- (NSString *)nameForCategory:(NSUInteger)category;
- (NSUInteger)numberOfPhotosInCategory;
- (NSString *)nameForPhotoAtPosition:(NSUInteger)position;
- (UIImage *)imageForPhotoAtPosition:(NSUInteger)position;

@end
