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

//calculate score of each day
-(double)calScoreOfDay:(int)ratingScore feedback:(int)feedbackScore
{
    //initialize
    double scoreOfDay = 1.0;
    
    //condition for "NO"
    if(feedbackScore == 1)
    {
        if(ratingScore == 1) //if 1
            {scoreOfDay = 1.0;}
        else if(ratingScore == 2)//if 2
            {scoreOfDay = 1.5;}
        else if (ratingScore == 3) //if 3
            {scoreOfDay = 2.0;}
        else if (ratingScore == 4) //if 4
            {scoreOfDay = 2.5;}
        else //if 5
            {scoreOfDay = 3.0;}
    }
    
    //condition for "KINDA"
    else if(feedbackScore == 2)
    {
        if(ratingScore == 1) //if 1
            {scoreOfDay = 1.0;}
        else if(ratingScore == 2)//if 2
            {scoreOfDay = 1.75;}
        else if (ratingScore == 3) //if 3
            {scoreOfDay = 2.5;}
        else if (ratingScore == 4) //if 4
            {scoreOfDay = 3.25;}
        else //if 5
            {scoreOfDay = 4.0;}
    }
    
    //condition for "YES" (feedbackScre == 3)
    else
    {
        if(ratingScore == 1) //if 1
            {scoreOfDay = 1.0;}
        else if(ratingScore == 2)//if 2
            {scoreOfDay = 2.0;}
        else if (ratingScore == 3) //if 3
            {scoreOfDay = 3.0;}
        else if (ratingScore == 4) //if 4
            {scoreOfDay = 4.0;}
        else //if 5
            {scoreOfDay = 5.0;}
    }
    
    return scoreOfDay;
}

//method to stratify the averaged scoreOfDay into Stages
-(NSString *)stageOfChange: (double)avgScoreOfDay
{
    if (1.0 <= avgScoreOfDay <=1.7 )
        {return @"Precontemplation";}
    else if (1.7 < avgScoreOfDay <= 2.4)
        {return @"Contemplation";}
    else if (2.4 < avgScoreOfDay  <= 3.25)
        {return @"Preparation";}
    else if (3.25 < avgScoreOfDay <= 4.25)
        {return @"Action";}
    else
        {return @"Maintenance";}
}



@end
