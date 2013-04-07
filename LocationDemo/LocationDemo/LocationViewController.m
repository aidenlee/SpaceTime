//
//  LocationViewController.m
//  LocationDemo
//
//  Created by Marshall Zhang on 4/6/13.
//  Copyright (c) 2013 Marshall Zhang. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()

@end

@implementation LocationViewController {
    CLLocationManager* locationManager ;
}

@synthesize coordsLabel ;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    locationManager = [[CLLocationManager alloc] init] ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getLocation:(id)sender {
    locationManager.delegate = self ;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest ;
    
    [locationManager startUpdatingLocation] ;
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError: %@", error) ;
    UIAlertView* errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to get your location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] ;
    [errorAlert show] ;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    NSLog(@"didUpdateToLocation: %@", newLocation) ;
    CLLocation* currentLocation = newLocation ;
    
    if (currentLocation != Nil) {
        coordsLabel.text = [NSString stringWithFormat:@"(%.2f,%.2f)",currentLocation.coordinate.latitude,currentLocation.coordinate.longitude] ;
    }
}
@end
