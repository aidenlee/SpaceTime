//
//  Activity.h
//  testDemo
//
//  Created by Aiden Lee on 2013-04-15.
//  Copyright (c) 2013 A/M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Activity : NSManagedObject

@property (nonatomic, retain) NSDate * checkInTime;
@property (nonatomic, retain) NSDate * checkOutTime;
@property (nonatomic, retain) NSString * name;

@end
