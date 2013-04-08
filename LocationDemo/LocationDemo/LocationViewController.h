//
//  LocationViewController.h
//  LocationDemo
//
//  Created by Marshall Zhang on 4/6/13.
//  Copyright (c) 2013 Marshall Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *coordsLabel;
- (IBAction)getLocation:(id)sender;
@property (nonatomic,retain) NSManagedObjectContext* managedObjectContext ;

@end
