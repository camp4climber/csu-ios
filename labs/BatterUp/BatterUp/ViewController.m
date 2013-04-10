//
//  ViewController.m
//  BatterUp
//
//  Created by Chris Morris on 4/4/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <MapKit/MapKit.h>

#import "ViewController.h"
#import "Ballpark.h"


@interface ViewController ()

@property (nonatomic, weak  ) IBOutlet MKMapView *mapView;
@property (nonatomic, strong)          NSArray   *ballparks;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.ballparks = [Ballpark allBallparks];
    [self.mapView addAnnotations:self.ballparks];
}

- (MKAnnotationView *) mapView:(MKMapView *)sender viewForAnnotation:(id<MKAnnotation>)annotation   
{
    MKAnnotationView *view = [sender dequeueReusableAnnotationViewWithIdentifier:@"annotation"];
    
    if (!view)
    {
   //     view = [[MKPinAnnotationView alloc] init];
        
     //   view.annotation = annotation;
       // view.canShowCallout = YES;
       // view.leftCalloutAccessoryView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    }
    return view;
}

- (void) mapView:(MKMapView *)sender didSelectAnnotationView:(MKAnnotationView *)view
{
    UIImageView *imageView = (UIImageView *)view.leftCalloutAccessoryView;
    UIImage *img = [[UIImage alloc] initWithContentsOfFile:((Ballpark *)view.annotation).logoName];
    imageView.image = img;
}

@end
