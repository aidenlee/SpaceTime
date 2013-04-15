//
//  TimeTableViewController.h
//  TimePartDemo
//
//  Created by Aiden Lee on 2013-04-14.
//  Copyright (c) 2013 A/M. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityCheckIn.h"
#import "ActivityCheckOut.h"

@interface TimeTableViewController : UITableViewController
@property (nonatomic, strong) NSArray *eventsArray;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@end
