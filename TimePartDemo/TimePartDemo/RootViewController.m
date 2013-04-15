//
//  RootViewController.m
//  TimePartDemo
//
//  Created by Aiden Lee on 2013-04-13.
//  Copyright (c) 2013 A/M. All rights reserved.
//

#import "RootViewController.h"
#import "TimeAppDelegate.h"
#import "TimeTableViewController.h"
#import "ActivityCheckIn.h"
#import "ActivityCheckOut.h"

@interface RootViewController ()

@end

@implementation RootViewController
@synthesize managedObjectContext;
@synthesize eventsArray = _eventsArray;

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"showAllActivities"]) {
        TimeAppDelegate* appDelegate = [TimeAppDelegate sharedAppDelegate];
        managedObjectContext = appDelegate.managedObjectContext;
        TimeTableViewController* newController = [segue destinationViewController];
        newController.managedObjectContext = managedObjectContext;
        newController.eventsArray = [[NSArray alloc] init];
        newController.eventsArray = self.eventsArray;
    }
}
- (void)addActivityWithCheckInTime:(NSDate *)checkInTime {
    
    //create and configure a new instance of the Activity
    ActivityCheckIn *startActivity = (ActivityCheckIn *)[NSEntityDescription insertNewObjectForEntityForName:@"ActivityCheckIn" inManagedObjectContext:self.managedObjectContext];
    startActivity.checkedInAt = checkInTime;
    [self.eventsArray insertObject:startActivity atIndex:0];
    
    // save activity in the database
    NSError *error = nil;
    if (![managedObjectContext save:&error]) {
        NSLog(@"Failed to save activity in the database");
    }
}

- (void)addActivityWithCheckOutTime:(NSDate *)checkOutTime {
    
    ActivityCheckOut *endActivity = (ActivityCheckOut *)[NSEntityDescription insertNewObjectForEntityForName:@"ActivityCheckOut" inManagedObjectContext:self.managedObjectContext];
    endActivity.checkOutAt = checkOutTime;
    [self.eventsArray insertObject:endActivity atIndex:0];
    
    NSError *error = nil;
    if (![managedObjectContext save:&error]) {
        NSLog(@"Failed to save activity in the database");
    }
}

- (IBAction)checkedInOutButtonPressed:(UIButton *)sender {
    NSDate *today = [NSDate date];
   
    if ([sender.currentTitle isEqualToString:@"Check In"]) {
        [self addActivityWithCheckInTime:today];
        [sender setTitle:@"Check Out" forState:UIControlStateNormal];
    } else if ([sender.currentTitle isEqualToString:@"Check Out"]) {
        [self addActivityWithCheckOutTime:today];
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
