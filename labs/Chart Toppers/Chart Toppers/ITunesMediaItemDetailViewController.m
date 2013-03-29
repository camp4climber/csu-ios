//
//  ITunesMediaItemDetailViewController.m
//  Chart Toppers
//
//  Created by Tim Whitaker on 3/28/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "ITunesMediaItemDetailViewController.h"

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
    self.titleLabel.text = self.item.title;
    self.artistLabel.text = self.item.artist;
    self.priceButton.titleLabel.text = self.item.price;
    self.rankLabel.text = [NSString stringWithFormat:@"%d", self.item.rank];
    self.categoryLabel.text = self.item.category;
    self.dateLabel.text = self.item.releaseDate;
    self.imageView.image = self.item.artworkImage;
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
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
