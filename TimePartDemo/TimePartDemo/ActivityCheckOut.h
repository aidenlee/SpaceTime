//
//  ActivityCheckOut.h
//  TimePartDemo
//
//  Created by Aiden Lee on 2013-04-14.
//  Copyright (c) 2013 A/M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ActivityCheckOut : NSManagedObject

@property (nonatomic, retain) NSDate * checkOutAt;

@end
