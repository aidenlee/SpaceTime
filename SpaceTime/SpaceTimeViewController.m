//
//  SpaceTimeViewController.m
//  SpaceTime
//
//  Created by Aiden Lee on 2013-04-06.
//  Copyright (c) 2013 A/M. All rights reserved.
//

#import "SpaceTimeViewController.h"

@interface SpaceTimeViewController ()

@end

@implementation SpaceTimeViewController
- (IBAction)checkInPressed:(UIButton *)sender
{
    if ([sender.currentTitle isEqualToString:@"Check In"]) {
        NSLog(@"Check in pressed: %@", sender.currentTitle);
        [sender setTitle:@"Check Out" forState:UIControlStateNormal];
    } else if ([sender.currentTitle isEqualToString:@"Check Out"]) {
        NSLog(@"Check out pressed: %@", sender.currentTitle);
        [sender setTitle:@"Check In" forState:UIControlStateNormal];
    }

    
}

@end
