//
//  RootViewController.h
//  SpaceTime
//
//  Created by Aiden Lee on 2013-04-08.
//  Copyright (c) 2013 A/M. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController
@property (nonatomic, retain) NSMutableArray *eventsArray;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, retain) UIBarButtonItem *addButton;
@end
