//
//  MapViewController.h
//  LocationDemo
//
//  Created by Marshall Zhang on 4/16/13.
//  Copyright (c) 2013 Marshall Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <CLLocationManagerDelegate,MKMapViewDelegate> {

    IBOutlet MKMapView *mapView;
    NSNumber* longitude ;
    NSNumber* latitude ;
    
}
@property (nonatomic,retain) NSNumber* longitude;
@property (nonatomic,retain) NSNumber* latitude;

@property (nonatomic,retain) IBOutlet MKMapView *mapView;

@end
