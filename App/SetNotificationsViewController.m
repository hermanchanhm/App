//
//  SetNotificationsViewController.m
//  App
//
//  Created by Herman on 11/18/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import "SetNotificationsViewController.h"

@interface SetNotificationsViewController ()

@end

@implementation SetNotificationsViewController

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

- (IBAction)updateTapped:(id)sender {
    //cancel all old notifications
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    //AM Notification
    NSDate *AMPickerDate = [self.AMPicker date];
    
    UILocalNotification* AMNotification = [[UILocalNotification alloc] init];
    AMNotification.fireDate = AMPickerDate;
    AMNotification.alertBody = @"How Motivated Are You? Lock it in now!";
    //AMNotification.alertAction = @"Good Morning!";
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
    PMNotification.alertBody = @"Have You Achieved Your Goals For Today?";
    //PMNotification.alertAction = @"Good Evening!";
    PMNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    PMNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:PMNotification];
    //Repeat Daily
    PMNotification.repeatInterval = NSDayCalendarUnit;
    
    //notify user changes
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Changes Saved"
                                                      message:nil
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
    
}
@end
