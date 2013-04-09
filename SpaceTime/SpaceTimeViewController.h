//
//  SpaceTimeViewController.h
//  SpaceTime
//
//  Created by Aiden Lee on 2013-04-06.
//  Copyright (c) 2013 A/M. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpaceTimeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *checkInOutButton;
@property (nonatomic, retain) NSMutableArray *activitiesArray;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) UIBarButtonItem *addButton;

@end
