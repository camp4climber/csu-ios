//
//  FontBookViewController.m
//  FontBook
//
//  Created by Tim Whitaker on 2/28/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "FontBookViewController.h"
#import "FontCell.h"
#import "ReusableView.h"

@interface FontBookViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation FontBookViewController

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

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FontCell *fontCell;
    if (indexPath.item % 2)
    {
        fontCell = [self.fontCollection dequeueReusableCellWithReuseIdentifier:@"oddFontCell" forIndexPath:indexPath];
    }
    else
    {
        fontCell = [self.fontCollection dequeueReusableCellWithReuseIdentifier:@"evenFontCell" forIndexPath:indexPath];
    }
    fontCell.fontCellLabel.text = [NSString stringWithFormat:@"%d", indexPath.item];
    return fontCell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    ReusableView *header = [self.fontCollection dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"fontHeader" forIndexPath:indexPath];
    header.headerLabel.text = [NSString stringWithFormat:@"Section %d", indexPath.section];
    return header;
}


@end