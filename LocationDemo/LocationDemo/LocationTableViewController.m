//
//  LocationTableViewController.m
//  LocationDemo
//
//  Created by Marshall Zhang on 4/7/13.
//  Copyright (c) 2013 Marshall Zhang. All rights reserved.
//

#import "LocationTableViewController.h"
#import "LocationAppDelegate.h"
#import "MapViewController.h"

@interface LocationTableViewController ()

@end

@implementation LocationTableViewController
@synthesize eventsArray ;
@synthesize managedObjectContext ;
@synthesize locationManager ;
@synthesize navigationController ;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (CLLocationManager*)locationManager {
    if (locationManager != Nil) {
        return locationManager ;
    }

    locationManager =[[CLLocationManager alloc] init] ;
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters ;
    [locationManager setDistanceFilter:15];
    locationManager.delegate = self ;

    return locationManager ;
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Failed with: %@", error) ;
    UIAlertView* errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Could not get location!" delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil] ;
    [errorAlert show] ;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"Locations" ;
    eventsArray = [[NSMutableArray alloc] init];
    
//    LocationAppDelegate* appDelegate = [LocationAppDelegate sharedAppDelegate];
//    [appDelegate navigationBar] ;
//    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"Back"
//                                                             style:UIBarButtonItemStylePlain
//                                                            target:nil
//                                                            action:nil];
//    [[self navigationItem] setBackBarButtonItem:back];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [eventsArray count] ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // date formatter for time
    static NSDateFormatter* dateFormatter = nil;
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle] ;
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle] ;
    }
    
    // number formatter for long/lat
    static NSNumberFormatter* numberFormatter = nil;
    if (numberFormatter == nil) {
        numberFormatter = [[NSNumberFormatter alloc] init] ;
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle] ;
        [numberFormatter setMaximumFractionDigits:3] ;
    }
    
    static NSString* CellIdentifier =@"Cell" ;
    
    // dequeue or create a new cell
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier] ;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    Event* event = (Event*)[eventsArray objectAtIndex:indexPath.row];
    
    if ([event.stationary intValue] == 1) {
        cell.textLabel.text = @"Currently stationary.";
    }
    else {
        cell.textLabel.text = @"Currently moving." ;
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"toMap"]) {
        LocationAppDelegate* appDelegate = [LocationAppDelegate sharedAppDelegate];
        managedObjectContext = appDelegate.managedObjectContext;
        MapViewController* newcontroller = [segue destinationViewController];
        newcontroller.longitude = [NSNumber numberWithInt:122.2];
        newcontroller.latitude =  [NSNumber numberWithFloat:123.3];       
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    //Value Selected by user
////    NSString *selectedValue = [displayValues objectAtIndex:indexPath.row];
//
//    //Initialize new viewController
//    MapViewController* mapViewController = [[MapViewController alloc] initWithNibName:nil bundle:nil];
//    //Pass selected value to a property declared in NewViewController
//    mapViewController.longitude = [NSNumber numberWithInt:122.2];
//    mapViewController.latitude =  [NSNumber numberWithFloat:123.3];
//    //Push new view to navigationController stack
//    [self.navigationController pushViewController:mapViewController animated:YES];
    [self performSegueWithIdentifier:@"toMap" sender:indexPath];
}

// addEvent stuff
- (void)addEventOfType:(NSNumber*)type {
    
    CLLocation* location = [locationManager location] ;
    if (!location) {
        return;
    }
    
    if (!managedObjectContext) {
        UIAlertView* errorAlert = [[UIAlertView alloc] initWithTitle:@"No Context" message:@"You failed." delegate:nil cancelButtonTitle:@"Oops." otherButtonTitles: nil] ;
        [errorAlert show] ;
    }
    
    // create entity
    Event* event = (Event*)[NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:managedObjectContext] ;
    
    CLLocationCoordinate2D coordinate = [location coordinate] ;
    [event setLatitude:[NSNumber numberWithDouble:coordinate.latitude]];
    [event setLongitude:[NSNumber numberWithDouble:coordinate.longitude]];
    [event setLocationTime:[NSDate date]];
    [event setStationary:type];
    
    NSError* error = nil;
    
    // save entity
    if (![managedObjectContext save:&error]) {
        UIAlertView* errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Could not add location!" delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil] ;
        [errorAlert show] ;
    }
    
    /* insert event in eventarray
       add a row to the top of the table
       scroll to the top row */
    [eventsArray insertObject:event atIndex:0] ;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0] ;
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade] ;
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES] ;
}
                             
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
     NSLog(@"didUpdateToLocation: %@", newLocation) ;
     CLLocation* currentLocation = newLocation ;
    
    CLLocationDistance movement = [newLocation distanceFromLocation:oldLocation];

    // always start with a stationary event
    if ((int)[eventsArray count] == 0) {
            [self addEventOfType:[NSNumber numberWithInt:1]];
    }
    else {        
        Event *latestEvent = [eventsArray objectAtIndex:0];
        
        // only add event if moving 
        if ([latestEvent.stationary intValue] == 1) {
            if (movement > 5 && currentLocation != nil) {
                [self addEventOfType:[NSNumber numberWithInt:0]];
            }
        }
        else {
            if (movement < 5 && currentLocation != nil) {
                [self addEventOfType:[NSNumber numberWithInt:1]];
            }
        }
    }
}
@end
