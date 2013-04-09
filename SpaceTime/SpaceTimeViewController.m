//
//  SpaceTimeViewController.m
//  SpaceTime
//
//  Created by Aiden Lee on 2013-04-06.
//  Copyright (c) 2013 A/M. All rights reserved.
//

#import "SpaceTimeViewController.h"
#import "Activity.h"
#import "SpaceTimeAppDelegate.h"

@interface SpaceTimeViewController ()

@end

@implementation SpaceTimeViewController

@synthesize checkInOutButton = _checkInOutButton;

- (IBAction)checkInPressed:(UIButton *)sender
{
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle: NSDateFormatterShortStyle];
    NSString *currentTime = [dateFormatter stringFromDate:today];
    
    if ([sender.currentTitle isEqualToString:@"Check In"]) {
        NSLog(@"Check in pressed: %@ at: %@", sender.currentTitle, currentTime);
        [sender setTitle:@"Check Out" forState:UIControlStateNormal];
    } else if ([sender.currentTitle isEqualToString:@"Check Out"]) {
        NSLog(@"Check out pressed: %@ at: %@", sender.currentTitle, currentTime);
        [sender setTitle:@"Check In" forState:UIControlStateNormal];
    }
    
    SpaceTimeAppDelegate *ad = (SpaceTimeAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *moc = ad.managedObjectContext;
    Activity *newActivity = (Activity *)[NSEntityDescription insertNewObjectForEntityForName:@"Activity" inManagedObjectContext:moc];
    newActivity.checkedIn = currentTime;
    newActivity.checkedOut = currentTime;
    NSError *error;
    if (![moc save:&error]) {
        NSLog(@"Error saving new Activity: %@", [error localizedDescription]);
    }
    [self.activitiesArray addObject:newActivity];
    // activity.save
}

@end
    