//
//  InitNotificationsViewController.m
//  App
//
//  Created by Herman on 11/18/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import "InitNotificationsViewController.h"

@interface InitNotificationsViewController ()

@end

@implementation InitNotificationsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextTapped:(id)sender {
    //cancel all old notifications
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    //AM Notification
    NSDate *AMPickerDate = [self.AMPicker date];
    
    UILocalNotification* AMNotification = [[UILocalNotification alloc] init];
    AMNotification.fireDate = AMPickerDate;
    AMNotification.alertBody = @"How motivated are you to change? Fill out the survey for today!";
    AMNotification.alertAction = @"Good Morning!";
    AMNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    AMNotification.timeZone = [NSTimeZone defaultTimeZone];
    
     [[UIApplication sharedApplication] scheduleLocalNotification:AMNotification];
    //Repeat Daily
    AMNotification.repeatInterval = NSDayCalendarUnit;
    
    //End AM Notification
    
    //PM Notification
    NSDate *PMPickerDate = [self.PMPicker date];
    
    UILocalNotification* PMNotification = [[UILocalNotification alloc] init];
    PMNotification.fireDate = PMPickerDate;
    PMNotification.alertBody = @"How many Goals you have achieved? Take the survey now!";
    PMNotification.alertAction = @"Good Evening!";
    PMNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    PMNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:PMNotification];
    //Repeat Daily
    PMNotification.repeatInterval = NSDayCalendarUnit;
    
    //below is code for cancel old notifications scheuled
    //[[UIApplication sharedApplication] cancelAllLocalNotifications];
    
}
@end
