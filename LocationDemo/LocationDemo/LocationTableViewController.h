//
//  LocationTableViewController.h
//  LocationDemo
//
//  Created by Marshall Zhang on 4/7/13.
//  Copyright (c) 2013 Marshall Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreData/CoreData.h>
#import "Event.h"
#import <MapKit/MapKit.h>

@interface LocationTableViewController : UITableViewController <CLLocationManagerDelegate> {
    
    NSMutableArray* eventsArray ;
    NSManagedObjectContext* managedObjectContext ;
    UINavigationController *navigationController ;
    CLLocationManager* locationManager ;

}

@property (nonatomic,retain) NSMutableArray* eventsArray ;
@property (nonatomic,retain) NSManagedObjectContext* managedObjectContext ;
@property (nonatomic,retain) CLLocationManager* locationManager ;
@property (nonatomic, retain) UINavigationController *navigationController;

- (void)AddEvent ;

@end
