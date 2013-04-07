//
//  LocationAppDelegate.h
//  LocationDemo
//
//  Created by Marshall Zhang on 4/6/13.
//  Copyright (c) 2013 Marshall Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSString *)applicationDocumentsDirectory;

@end
