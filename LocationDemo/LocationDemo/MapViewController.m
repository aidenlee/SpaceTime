//
//  MapViewController.m
//  LocationDemo
//
//  Created by Marshall Zhang on 4/16/13.
//  Copyright (c) 2013 Marshall Zhang. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize mapView;
@synthesize latitude ;
@synthesize longitude ;

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
    self.mapView.delegate = self;
    CLLocationCoordinate2D coord;
    coord.longitude = (CLLocationDegrees)[self.longitude doubleValue];
    coord.latitude = (CLLocationDegrees)[self.latitude doubleValue];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
