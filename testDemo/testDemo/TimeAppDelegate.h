//
//  TimeAppDelegate.h
//  testDemo
//
//  Created by Aiden Lee on 2013-04-15.
//  Copyright (c) 2013 A/M. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
+ (TimeAppDelegate *)sharedAppDelegate;
@end
