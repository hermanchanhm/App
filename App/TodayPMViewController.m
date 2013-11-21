//
//  TodayPMViewController.m
//  App
//
//  Created by Herman on 11/18/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import "TodayPMViewController.h"

@interface TodayPMViewController ()
{
    RatingScale *objScale;
    NSMutableArray *arrFeedback;
}

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
    objScale = [[RatingScale alloc]init];
    arrFeedback = [objScale getFeedback];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnEndDayTapped:(id)sender {
   
    //store feedback info
    [objScale dayCompleted];
    [self getCurrentFeedback];
    [objScale setFeedback:arrFeedback];
    
    //navigate back to TodayView
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController popViewControllerAnimated:YES];
  
}

-(void)setCurrentFeedBack{
    self.segmentFb01.selectedSegmentIndex = [[arrFeedback objectAtIndex:0] intValue];
    self.segmentFb02.selectedSegmentIndex = [[arrFeedback objectAtIndex:1] intValue];
    self.segmentFb03.selectedSegmentIndex = [[arrFeedback objectAtIndex:2] intValue];
    self.segmentFb04.selectedSegmentIndex = [[arrFeedback objectAtIndex:3] intValue];
    self.segmentFb05.selectedSegmentIndex = [[arrFeedback objectAtIndex:4] intValue];
}

-(void)getCurrentFeedback{
    [self resetArrayFeedback];
    
    NSInteger value;
    
    value = [[self segmentFb01]selectedSegmentIndex] + 1;
    [arrFeedback replaceObjectAtIndex:0 withObject:[NSNumber numberWithInt:value]];
    
    value = [[self segmentFb02]selectedSegmentIndex] + 1;
    [arrFeedback replaceObjectAtIndex:1 withObject:[NSNumber numberWithInt:value]];
    
    value = [[self segmentFb03]selectedSegmentIndex] + 1;
    [arrFeedback replaceObjectAtIndex:2 withObject:[NSNumber numberWithInt:value]];
    
    value = [[self segmentFb04]selectedSegmentIndex] + 1;
    [arrFeedback replaceObjectAtIndex:3 withObject:[NSNumber numberWithInt:value]];
    
    value = [[self segmentFb05]selectedSegmentIndex] + 1;
    [arrFeedback replaceObjectAtIndex:4 withObject:[NSNumber numberWithInt:value]];
    
}

-(void)resetArrayFeedback{
    [arrFeedback removeAllObjects];
    
    for(int i =0; i<5; i++){
        [arrFeedback addObject:[NSNumber numberWithInt:1]];
    }
}


@end
