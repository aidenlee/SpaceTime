//
//  Activity.h
//  SpaceTime
//
//  Created by Aiden Lee on 2013-04-08.
//  Copyright (c) 2013 A/M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Activity : NSManagedObject

@property (nonatomic) NSString *checkedIn;
@property (nonatomic) NSString *checkedOut;
@property (nonatomic, retain) NSString *name;

@end
