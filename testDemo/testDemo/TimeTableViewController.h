//
//  TimeTableViewController.h
//  testDemo
//
//  Created by Aiden Lee on 2013-04-15.
//  Copyright (c) 2013 A/M. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Activity.h"
@interface TimeTableViewController : UITableViewController
@property (nonatomic, strong) NSArray *eventsArray;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@end
