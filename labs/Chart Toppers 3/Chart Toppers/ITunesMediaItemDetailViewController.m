//
//  ITunesMediaItemDetailViewController.m
//  Chart Toppers
//
//  Created by Tim Whitaker on 3/28/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "ITunesMediaItemDetailViewController.h"
#import "FavoritesManager.h"

@interface ITunesMediaItemDetailViewController ()

@end

@implementation ITunesMediaItemDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = self.item.title;
    self.titleLabel.text = self.item.title;
    self.artistLabel.text = self.item.artist;
    self.priceButton.titleLabel.text = self.item.price;
    self.rankLabel.text = [NSString stringWithFormat:@"%d", self.item.rank];
    self.categoryLabel.text = self.item.category;
    self.dateLabel.text = self.item.releaseDate;
    if (!self.item.summary)
    {
        self.summaryText.text = @"No description available.";
    }
    else
    {
        self.summaryText.text = self.item.summary;
    }
    
    if ([[FavoritesManager sharedFavoritesManager] isFavorite:self.item])
    {
        self.faveImage.image = [UIImage imageNamed:@"star_yellow.png"];
    }
    else
    {
        self.faveImage.image = [UIImage imageNamed:@"star_grey.png"];
    }
    
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicatorView.center = self.imageView.center;
    indicatorView.hidesWhenStopped = YES;
    [self.view addSubview:indicatorView];
    [indicatorView startAnimating];
    
    dispatch_queue_t q = dispatch_queue_create("image SON", NULL);
    dispatch_async(q, ^{
        [NSThread sleepForTimeInterval:drand48() * 3.0];
        UIImage *image = self.item.artworkImage;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
            [indicatorView stopAnimating];
        });
    });
    self.summaryText.frame = CGRectMake(20,0,self.summaryText.contentSize.width,self.summaryText.contentSize.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareButton:(UIBarButtonItem *)sender {
    NSArray *dataToShare = [[NSArray alloc] initWithObjects:self.item.title,
                            self.item.artist,
                            self.item.price,
                            self.item.category,
                            self.item.releaseDate,
                            self.item.artworkImage,
                            nil];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:dataToShare applicationActivities:nil];
    [self presentViewController:activityVC animated:YES completion:nil];
}

- (IBAction)goToURL:(UIButton *)sender {
    NSURL *url = [self.item storeURL];
    self.priceButton.titleLabel.text = self.item.price;
    [[UIApplication sharedApplication] openURL:url];
}

- (IBAction)faveTapped:(UITapGestureRecognizer *)sender
{
    if ([[FavoritesManager sharedFavoritesManager] isFavorite:self.item]) {
        [[FavoritesManager sharedFavoritesManager] removeFavorite:self.item];
        self.faveImage.image = [UIImage imageNamed:@"star_grey.png"];
    }
    else {
        [[FavoritesManager sharedFavoritesManager] addFavorite:self.item];
        self.faveImage.image = [UIImage imageNamed:@"star_yellow.png"];
    }
}



#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
            //lame lame lame but will do for now
            return 173;
            break;
        case 1:
            return 44;
            break;
        case 2:
            return self.summaryText.contentSize.height;
            break;
    }
    return 0;
}

@end
