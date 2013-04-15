//
//  RootViewController.h
//  TimePartDemo
//
//  Created by Aiden Lee on 2013-04-13.
//  Copyright (c) 2013 A/M. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityCheckIn.h"
#import "ActivityCheckOut.h"

@interface RootViewController : UIViewController

@property (nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSMutableArray *eventsArray;

- (void)addActivityWithCheckInTime:(NSDate *)checkInTime;
- (void)addActivityWithCheckOutTime:(NSDate *)checkOutTime;

@end
