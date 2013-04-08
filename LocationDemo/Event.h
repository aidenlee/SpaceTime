//
//  Event.h
//  LocationDemo
//
//  Created by Marshall Zhang on 4/8/13.
//  Copyright (c) 2013 Marshall Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Event : NSManagedObject

@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSDate * locationTime;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSNumber * stationary;

@end
