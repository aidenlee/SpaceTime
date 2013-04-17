//
//  Activity.h
//  TimePartDemo
//
//  Created by Aiden Lee on 2013-04-14.
//  Copyright (c) 2013 A/M. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Activity : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDate *checkedInAt;
@property (nonatomic, strong) NSDate *checkedOutAt;
@end
