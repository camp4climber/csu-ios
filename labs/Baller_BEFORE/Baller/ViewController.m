//
//  ViewController.m
//  Baller
//
//  Created by Chris Morris on 4/11/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "ViewController.h"
#import "CMMotionManager+Shared.h"

#define CAPTURES_PER_SECOND 10

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ballImageView;
@property (weak, nonatomic) IBOutlet UILabel     *accelerometerLabel;
@property (weak, nonatomic) IBOutlet UILabel     *gyroLabel;
@property (weak, nonatomic) IBOutlet UILabel     *magnetometerLabel;
@property (weak, nonatomic) IBOutlet UILabel     *motionAttitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel     *motionRotationRateLabel;
@property (weak, nonatomic) IBOutlet UILabel     *motionAccelerationGravityLabel;
@property (weak, nonatomic) IBOutlet UILabel     *motionAccelerationUserLabel;
@property (weak, nonatomic) IBOutlet UILabel     *motionMagneticFieldLabel;
@property (weak, nonatomic) IBOutlet UILabel     *motionMagneticFieldAccuracyLabel;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    UITapGestureRecognizer *tapToMoveBallRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToMoveBall:)];
    tapToMoveBallRecognizer.numberOfTapsRequired = 1;
    tapToMoveBallRecognizer.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tapToMoveBallRecognizer];
    
    [self startAllMotionUpdates];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    [self stopAllMotionUpdates];
}

- (void)startAllMotionUpdates
{
    [self startAccelerometerUpdates];
    [self startGyroUpdates];
    [self startMagnetometerUpdates];
    [self startDeviceMotionUpdates];
}

- (void)stopAllMotionUpdates
{
    [self stopAccelerometerUpdates];
    [self stopGyroUpdates];
    [self stopMagnetometerUpdates];
    [self stopDeviceMotionUpdates];
}

- (void)startAccelerometerUpdates
{
    CMMotionManager *motionManager = [CMMotionManager sharedMotionManager];

    if ([motionManager isAccelerometerAvailable]) {
        [motionManager setAccelerometerUpdateInterval:1/CAPTURES_PER_SECOND];
        
        [motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue]
                                            withHandler:^(CMAccelerometerData *data, NSError *error) {
                                                self.accelerometerLabel.text = [NSString stringWithFormat:@"x: %+.3f y: %+.3f z: %+.3f", data.acceleration.x, data.acceleration.y, data.acceleration.z];
                                                CGPoint point = self.ballImageView.center;
                                                CGPoint new = CGPointMake(point.x + data.acceleration.x, point.y - data.acceleration.y);
                                                self.ballImageView.center = new;
                                            }];
    }
    else {
        NSLog(@"Accelerometer is unavailable.");
    }
}

- (void)stopAccelerometerUpdates
{
    [[CMMotionManager sharedMotionManager] stopAccelerometerUpdates];
}

- (void)startGyroUpdates
{
    CMMotionManager *motionManager = [CMMotionManager sharedMotionManager];

    if ([motionManager isGyroAvailable]) {
        [motionManager setGyroUpdateInterval:1/CAPTURES_PER_SECOND];

        [motionManager startGyroUpdatesToQueue:[NSOperationQueue mainQueue]
                                   withHandler:^(CMGyroData *data, NSError *error) {
                                       self.gyroLabel.text = [NSString stringWithFormat:@"x: %+.3f y: %+.3f z: %+.3f", data.rotationRate.x, data.rotationRate.y, data.rotationRate.z];
                                   }];
    }
    else {
        NSLog(@"Gyro is unavailble.");
    }
}

- (void)stopGyroUpdates
{
    [[CMMotionManager sharedMotionManager] stopGyroUpdates];
}

- (void)startMagnetometerUpdates
{
    CMMotionManager *motionManager = [CMMotionManager sharedMotionManager];

    if ([motionManager isMagnetometerAvailable]) {
        [motionManager setMagnetometerUpdateInterval:1/CAPTURES_PER_SECOND];

        [motionManager startMagnetometerUpdatesToQueue:[NSOperationQueue mainQueue]
                                           withHandler:^(CMMagnetometerData *data, NSError *error) {
                                               self.magnetometerLabel.text = [NSString stringWithFormat:@"x: %+.3f y: %+.3f z: %+.3f", data.magneticField.x, data.magneticField.y, data.magneticField.z];
                                           }];
    }
    else {
        NSLog(@"Magnetometer is unavailable.");
    }
}

- (void)stopMagnetometerUpdates
{
    [[CMMotionManager sharedMotionManager] stopMagnetometerUpdates];
}

- (void)startDeviceMotionUpdates
{
    CMMotionManager *motionManager = [CMMotionManager sharedMotionManager];

    if ([motionManager isDeviceMotionAvailable]) {
        [motionManager setDeviceMotionUpdateInterval:1/CAPTURES_PER_SECOND];

        [motionManager startDeviceMotionUpdatesUsingReferenceFrame:CMAttitudeReferenceFrameXMagneticNorthZVertical
                                                           toQueue:[NSOperationQueue mainQueue]
                                                       withHandler:^(CMDeviceMotion *data, NSError *error) {
                                                           self.motionAttitudeLabel.text              = [NSString stringWithFormat:@"yaw: %+.3f pitch: %+.3f roll: %+.3f", data.attitude.yaw, data.attitude.pitch, data.attitude.roll];
                                                           self.motionRotationRateLabel.text          = [NSString stringWithFormat:@"x: %+.3f y: %+.3f z: %+.3f", data.rotationRate.x, data.rotationRate.y, data.rotationRate.z];
                                                           self.motionAccelerationGravityLabel.text   = [NSString stringWithFormat:@"x: %+.3f y: %+.3f z: %+.3f", data.gravity.x, data.gravity.y, data.gravity.z];
                                                           self.motionAccelerationUserLabel.text      = [NSString stringWithFormat:@"x: %+.3f y: %+.3f z: %+.3f", data.userAcceleration.x, data.userAcceleration.y, data.userAcceleration.z];
                                                           self.motionMagneticFieldLabel.text         = [NSString stringWithFormat:@"x: %+.3f y: %+.3f z: %+.3f", data.magneticField.field.x, data.magneticField.field.y, data.magneticField.field.z];
                                                           self.motionMagneticFieldAccuracyLabel.text = [NSString stringWithFormat:@"%d", data.magneticField.accuracy];
                                                       }];
    }
    else {
        NSLog(@"Device Motion is unavailable.");
    }
}

- (void)stopDeviceMotionUpdates
{
    [[CMMotionManager sharedMotionManager] stopDeviceMotionUpdates];
}

- (void) tapToMoveBall:(UITapGestureRecognizer *)recognizer
{
    CGPoint location = [recognizer locationInView:self.view];
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.ballImageView.center = location;
    } completion:nil];
}

@end
