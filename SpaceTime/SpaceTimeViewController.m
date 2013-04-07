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
    NSLog(@"Check in pressed: %@", [sender currentTitle]);
    [sender setTitle:@"Check out" forState:UIControlStateNormal];
}

@end
