//
//  LocationAppDelegate.h
//  LocationDemo
//
//  Created by Marshall Zhang on 4/6/13.
//  Copyright (c) 2013 Marshall Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationAppDelegate : UIResponder <UIApplicationDelegate> {
    NSManagedObjectContext* managedObjectContext ;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSString *)applicationDocumentsDirectory;

+ (LocationAppDelegate*)sharedAppDelegate;


@end
