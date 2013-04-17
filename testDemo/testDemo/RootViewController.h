//
//  RootViewController.h
//  testDemo
//
//  Created by Aiden Lee on 2013-04-15.
//  Copyright (c) 2013 A/M. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

@property (nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSMutableArray *eventsArray;

- (void)addActivityWithCheckInTime:(NSDate *)checkInTime;
- (void)updateActivityWithCheckOutTime:(NSDate *)checkOutTime;

@end
