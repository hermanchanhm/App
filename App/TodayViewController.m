//
//  TodayViewController.m
//  App
//
//  Created by Herman on 11/17/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import "TodayViewController.h"

@interface TodayViewController ()

@end

@implementation TodayViewController

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
    
    
    self.quoteArray = [[NSArray alloc] initWithObjects:@"Dietkjfkqjekqehfqkejfqkwfjhqwkjqhwkgjqwhkgjhwkjqhwkqhgkjqhgkqjwhg",@"Exercise",@"Bad Habits",@"Take Your Meds!",@"Monitoring", nil];
    //random generate quote and display quote
    int index = arc4random() %5;
    self.quoteTextView.text = self.quoteArray[index];
    
    
    //hides the back button
    self.navigationItem.hidesBackButton = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
//Action when button tapped
- (IBAction)btnTapped:(id)sender {
    
    [self.dayLabel setText:@"Day 2"];
    
    //code to save the selections...
}
@end
