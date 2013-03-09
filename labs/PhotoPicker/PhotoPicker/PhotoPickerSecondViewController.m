//
//  PhotoPickerSecondViewController.m
//  PhotoPicker
//
//  Created by Tim Whitaker on 2/25/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "PhotoPickerSecondViewController.h"
#import "PhotoCollectionViewCell.h"
#import "PhotoCategoryReusableView.h"
#import "PhotoLibrary.h"
#import "GridImageViewController.h"

@interface PhotoPickerSecondViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) PhotoLibrary *photoLibrary;
@end

@implementation PhotoPickerSecondViewController

- (PhotoLibrary *) photoLibrary
{
    if (!_photoLibrary)
        _photoLibrary = [[PhotoLibrary alloc] init];
    return _photoLibrary;
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

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.photoLibrary numberOfCategories];
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            self.photoLibrary.currentCategory = @"Climbing";
            return [self.photoLibrary numberOfPhotosInCategory];
            break;
        case 1:
            self.photoLibrary.currentCategory = @"Space";
            return [self.photoLibrary numberOfPhotosInCategory];
            break;
        case 2:
            self.photoLibrary.currentCategory = @"Earth";
            return [self.photoLibrary numberOfPhotosInCategory];
            break;
    }
    return 0;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCollectionViewCell *photoCell;
    photoCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    switch (indexPath.section)
    {
        case 0:
            self.photoLibrary.currentCategory = @"Climbing";
            photoCell.cellImage.image = [self.photoLibrary imageForPhotoAtPosition:indexPath.item];
            break;
        case 1:
            self.photoLibrary.currentCategory = @"Space";
            photoCell.cellImage.image = [self.photoLibrary imageForPhotoAtPosition:indexPath.item];
            break;
        case 2:
            self.photoLibrary.currentCategory = @"Earth";
            photoCell.cellImage.image = [self.photoLibrary imageForPhotoAtPosition:indexPath.item];
            break;
    }
    return photoCell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    PhotoCategoryReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"categoryHeader" forIndexPath:indexPath];
    switch (indexPath.section)
    {
        case 0:
            header.headerLabel.text = @"Climbing";
            break;
        case 1:
            header.headerLabel.text = @"Space";
            break;
        case 2:
            header.headerLabel.text = @"Earth";
            break;
    }
    
    return header;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    GridImageViewController *imageVC  = segue.destinationViewController;
    NSIndexPath *indexPath = [self.photoCollection indexPathForCell:sender];
    
    switch (indexPath.section)
    {
        case 0:
            self.photoLibrary.currentCategory = @"Climbing";
            break;
        case 1:
            self.photoLibrary.currentCategory = @"Space";
            break;
        case 2:
            self.photoLibrary.currentCategory = @"Earth";
            break;
    }
    imageVC.img = [self.photoLibrary imageForPhotoAtPosition:indexPath.item];
    imageVC.labelText = [self.photoLibrary nameForPhotoAtPosition:indexPath.item];
}


@end
