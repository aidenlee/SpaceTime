//
//  ActivityCheckIn.h
//  TimePartDemo
//
//  Created by Aiden Lee on 2013-04-14.
//  Copyright (c) 2013 A/M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ActivityCheckIn : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * checkedInAt;

@end
