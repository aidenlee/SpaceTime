//
//  SpaceTimeAppDelegate.h
//  SpaceTime
//
//  Created by Aiden Lee on 2013-04-06.
//  Copyright (c) 2013 A/M. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpaceTimeAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, retain) UINavigationController *navigationController;
-(void)saveContext;
-(NSURL *)applicationDocumentDirectory;

@end
