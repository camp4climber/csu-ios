//
//  HomePageViewController.m
//  TopoShot
//
//  Created by Tim Whitaker on 3/9/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "HomePageViewController.h"
#import "ImagePickerViewController.h"
#import "TopoShotViewController.h"

@interface HomePageViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property(strong, nonatomic) ImagePickerViewController *picker;
@property(strong, nonatomic) TopoShotViewController *topo;

@end

@implementation HomePageViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (ImagePickerViewController *)picker
{
    if (!_picker) _picker = [[ImagePickerViewController alloc] init];
    return _picker;
}

- (TopoShotViewController *)topo
{
    if (!_topo) _topo = [[TopoShotViewController alloc] init];
    return _topo;
}

- (IBAction)getPhoto:(UIButton *)sender
{
    self.picker.delegate = self;
    switch (sender.tag)
    {
        case 1:
            self.picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            break;
        case 2:
            self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            break;
    }
    [self dismissViewControllerAnimated:NO completion:nil];
    [self presentViewController:self.picker animated:YES completion:nil];
}

- (IBAction)savePhoto:(UIButton *)sender
{
    //[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
	self.imageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    self.saveButton.hidden = NO;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    if (sender.tag == 3)
    {
        TopoShotViewController *vc = segue.destinationViewController;
        vc.image = self.imageView.image;
    }
}


@end
