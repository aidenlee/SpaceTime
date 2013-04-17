//
//  RootViewController.m
//  testDemo
//
//  Created by Aiden Lee on 2013-04-15.
//  Copyright (c) 2013 A/M. All rights reserved.
//

#import "RootViewController.h"
#import "TimeAppDelegate.h"
#import "Activity.h"
#import "TimeTableViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"Show All Activities"]) {
        TimeAppDelegate* appDelegate = [TimeAppDelegate sharedAppDelegate];
        self.managedObjectContext = appDelegate.managedObjectContext;
        TimeTableViewController* newController = [segue destinationViewController];
        newController.managedObjectContext = self.managedObjectContext;
        newController.eventsArray = [[NSArray alloc] init];
        newController.eventsArray = self.eventsArray;
    }
}

- (void)addActivityWithCheckInTime:(NSDate *)checkInTime {
    //create and configure a new instance of the Activity
    Activity *startActivity = (Activity *)[NSEntityDescription insertNewObjectForEntityForName:@"Activity" inManagedObjectContext:self.managedObjectContext];
    startActivity.checkInTime = checkInTime;
    [self.eventsArray insertObject:startActivity atIndex:0];
    
    // save activity in the database
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Failed to save activity in the database");
    } else {
        NSLog(@"SUCCESS");
    }
}

- (void)updateActivityWithCheckOutTime:(NSDate *)checkOutTime {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Activity" inManagedObjectContext:self.managedObjectContext];
    [request setEntity:entity];
    NSPredicate *activityWithNoCheckOutTime = [NSPredicate predicateWithFormat:@"checkOutTime = nil"];
    [request setPredicate:activityWithNoCheckOutTime];
    
    NSError *error = nil;
    NSArray *results = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (results == nil) {
        NSLog(@"No Results found");
    }
    Activity *activity = [results objectAtIndex:0];
    activity.checkOutTime = checkOutTime;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Failed to save activity in the database");
    } else {
        NSLog(@"SUCCESS");
    }
    [self.eventsArray removeObjectAtIndex:0];
    [self.eventsArray insertObject:activity atIndex:0];
}


- (IBAction)checkInOutButtonPressed:(UIButton *)sender {
    NSDate *today = [NSDate date];
    if ([sender.currentTitle isEqualToString:@"Check In"]) {
        [self addActivityWithCheckInTime:today];
        [sender setTitle:@"Check Out" forState:UIControlStateNormal];
    } else if ([sender.currentTitle isEqualToString:@"Check Out"]) {
        [self updateActivityWithCheckOutTime:today];
        [sender setTitle:@"Check In" forState:UIControlStateNormal];
    }

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    TimeAppDelegate *appDelegate = [TimeAppDelegate sharedAppDelegate];
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    self.managedObjectContext = context;
    self.eventsArray = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
