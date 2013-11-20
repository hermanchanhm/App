//
//  TodayPMViewController.m
//  App
//
//  Created by Herman on 11/18/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import "TodayPMViewController.h"
#import "TodayViewController.h"

@interface TodayPMViewController ()

@end

@implementation TodayPMViewController

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
    
    //set title as today's date
    //format date
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd"];
    //date for today
    NSDate *today = [[NSDate alloc] init];
    
    self.navigationItem.title = [NSString stringWithFormat: @"Today - %@",[dateFormatter stringFromDate:today]];
    //end

    
    //hides the back button
    self.navigationItem.hidesBackButton = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnEndDayTapped:(id)sender {
   
    //code to save the selections......
    
}
@end
