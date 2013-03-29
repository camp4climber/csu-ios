//
//  SpeedUpViewController.m
//  SpeedUp
//
//  Created by Chris Morris on 3/14/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "SpeedUpViewController.h"

#define PHOTO_PLIST_FILE @"image_urls.plist"

@interface SpeedUpViewController ()

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *photoList;

@end

@implementation SpeedUpViewController

- (NSArray *)photoList
{
    if (!_photoList) {
//        NSString *path = [[NSBundle mainBundle] pathForResource:PHOTO_PLIST_FILE ofType:@"plist"];
//
//        _photoList = [[NSArray alloc] initWithContentsOfFile:path];

        NSString *errorMsg = nil;
        NSPropertyListFormat format;
        NSString *plistPath;
        NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        plistPath = [rootPath stringByAppendingPathComponent:@"image_urls.plist"];
        if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath])
        {
            plistPath = [[NSBundle mainBundle] pathForResource:@"image_urls" ofType:@"plist"];
        }
        NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
        NSDictionary *tmp = (NSDictionary *)[NSPropertyListSerialization propertyListFromData:plistXML mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorMsg];
        if (!tmp)
        {
            NSLog(@"Error reading plist. %@, format: %d", errorMsg, format);
        }
        _photoList = [[NSArray alloc] initWithContentsOfFile:plistPath];
    }

    return _photoList;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSUInteger photoCount   = [self.photoList count];
    CGSize     viewableSize = self.scrollView.frame.size;

    self.scrollView.contentSize = CGSizeMake(viewableSize.width * photoCount, viewableSize.height);
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;
    
    
    UIApplication *myApplication = [UIApplication sharedApplication];
    
    [self.photoList enumerateObjectsUsingBlock:^(NSString *curString, NSUInteger idx, BOOL *stop){
        
        NSURL  *currentPhotoURL = [[NSURL alloc] initWithString:self.photoList[idx]];
    
        CGRect imageFrame = CGRectMake(viewableSize.width * idx,
                                   0,
                                   viewableSize.width,
                                   viewableSize.height);
    
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageFrame];
        
        // NOTE: You are not allowed to remove or change the call to sleep
        //       It must always preceed your NSData call in order to simulate a delay
       
        dispatch_queue_t q = dispatch_queue_create("image download", NULL);

        dispatch_async(q, ^{
            myApplication.networkActivityIndicatorVisible = YES;
            [NSThread sleepForTimeInterval:2.0];
            NSData  *imageData = [[NSData alloc] initWithContentsOfURL:currentPhotoURL];
            
            dispatch_async(dispatch_get_main_queue(), ^{

                UIImage *image  = [UIImage imageWithData:imageData];
                imageView.contentMode = UIViewContentModeScaleAspectFill;
                imageView.image = image;
                
                [self.scrollView addSubview:imageView];
            });
        });
                
        myApplication.networkActivityIndicatorVisible = NO;
    }];
}

@end
