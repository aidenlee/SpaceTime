//
//  LocationAppDelegate.m
//  LocationDemo
//
//  Created by Marshall Zhang on 4/6/13.
//  Copyright (c) 2013 Marshall Zhang. All rights reserved.
//

#import "LocationAppDelegate.h"
#import "LocationViewController.h"
#import "LocationTableViewController.h"

@implementation LocationAppDelegate

@synthesize managedObjectModel,managedObjectContext,persistentStoreCoordinator;
@synthesize navigationController;

// core data stuff
- (NSManagedObjectContext *) managedObjectContext {
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    return managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel

{
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    else
    {
        managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
        return managedObjectModel;
    }
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
    
    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"Model.sqlite"]];
    
    NSError *error = nil;
    
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
        
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        
        abort();
    }
    
    return persistentStoreCoordinator;
}

- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

// application stuff
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    LocationViewController* locationViewController = [[LocationViewController alloc] initWithNibName:nil bundle:nil] ;
    
    NSManagedObjectContext* context = [self managedObjectContext] ;
    
    if (!context) {
        UIAlertView* errorAlert = [[UIAlertView alloc] initWithTitle:@"No Context" message:@"You failed." delegate:nil cancelButtonTitle:@"Oops." otherButtonTitles: nil] ;
        [errorAlert show] ;
    }
    
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:locationViewController];
    
    [self.window addSubview:navigationController.view];
    [self.window makeKeyAndVisible];

//    LocationTableViewController* locationTableViewController = [[LocationTableViewController alloc] initWithStyle:UITableViewStylePlain] ;
//    
//    NSManagedObjectContext* context = [self managedObjectContext] ;
//    
//    if (!context) {
//        UIAlertView* errorAlert = [[UIAlertView alloc] initWithTitle:@"No Context" message:@"You failed." delegate:nil cancelButtonTitle:@"Oops." otherButtonTitles: nil] ;
//        [errorAlert show] ;
//    }
//    
//    self.navigationController = [[UINavigationController alloc] initWithRootViewController:locationTableViewController];
//
//    [self.window makeKeyAndVisible];
//    [self.window addSubview:navigationController.view];
    
    // Override point for customization after application launch.
    return YES;
}

//- (void)navigationBar {
//    LocationTableViewController* locationTableViewController = [[LocationTableViewController alloc] initWithStyle:UITableViewStylePlain] ;
//
//    UINavigationController *aNavigationController = [[UINavigationController alloc]
//                                                     initWithRootViewController:locationTableViewController];
//    self.navigationController = aNavigationController;
//    
//    [_window addSubview:[navigationController view]];
//
//}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSError *error = nil;
    
    if (managedObjectContext != nil) {
        
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            
            abort();
            
        }
        
    }
}

+ (LocationAppDelegate *)sharedAppDelegate
{
    return (LocationAppDelegate *)[[UIApplication sharedApplication] delegate];
}


@end
