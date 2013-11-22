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
    bool isSaved;
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
    self.txtGoal01.adjustsFontSizeToFitWidth = YES;
    self.txtGoal02.adjustsFontSizeToFitWidth = YES;
    self.txtGoal03.adjustsFontSizeToFitWidth = YES;
    self.txtGoal04.adjustsFontSizeToFitWidth = YES;
    self.txtGoal05.adjustsFontSizeToFitWidth = YES;
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
    
    if(self.objScale == nil)
        self.objScale = [[RatingScale alloc] init];
    [self.objScale getFeedback];
    [self.objScale getDayCount];
    isSaved = false;
    
    [self setGoalTitle];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.objScale getDayCount];
    [self.objScale reloadData];
    [self setCurrentFeedBack];
    isSaved = false;
}

-(void)viewWillDisappear:(BOOL)animated
{
    if(!isSaved)
    {
        [self getCurrentFeedback];
        [self.objScale setFeedback];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnEndDayTapped:(id)sender {
   
    //store feedback info

    [self getCurrentFeedback];
    [self.objScale setFeedback];
    [self.objScale dayCompleted];
    isSaved = true;
    
    AppStage * objScale = [[AppStage alloc]init];
    [objScale setStage:1];
    
    //navigate back to TodayView
    [self.navigationController popViewControllerAnimated:YES];
  
}

-(void)setCurrentFeedBack{
    self.segmentFb01.selectedSegmentIndex = [[self.objScale.arrFeedback objectAtIndex:0] intValue] -1;
    self.segmentFb02.selectedSegmentIndex = [[self.objScale.arrFeedback objectAtIndex:1] intValue] -1;
    self.segmentFb03.selectedSegmentIndex = [[self.objScale.arrFeedback objectAtIndex:2] intValue] -1;
    self.segmentFb04.selectedSegmentIndex = [[self.objScale.arrFeedback objectAtIndex:3] intValue] -1;
    self.segmentFb05.selectedSegmentIndex = [[self.objScale.arrFeedback objectAtIndex:4] intValue] -1;
}

-(void)getCurrentFeedback{
    [self resetArrayFeedback];
    
    NSInteger value;
    
    value = [[self segmentFb01]selectedSegmentIndex] + 1;
    [self.objScale.arrFeedback replaceObjectAtIndex:0 withObject:[NSNumber numberWithInt:value]];
    
    value = [[self segmentFb02]selectedSegmentIndex] + 1;
    [self.objScale.arrFeedback replaceObjectAtIndex:1 withObject:[NSNumber numberWithInt:value]];
    
    value = [[self segmentFb03]selectedSegmentIndex] + 1;
    [self.objScale.arrFeedback replaceObjectAtIndex:2 withObject:[NSNumber numberWithInt:value]];
    
    value = [[self segmentFb04]selectedSegmentIndex] + 1;
    [self.objScale.arrFeedback replaceObjectAtIndex:3 withObject:[NSNumber numberWithInt:value]];
    
    value = [[self segmentFb05]selectedSegmentIndex] + 1;
    [self.objScale.arrFeedback replaceObjectAtIndex:4 withObject:[NSNumber numberWithInt:value]];
    
}

-(void)resetArrayFeedback{
    [self.objScale.arrFeedback removeAllObjects];
    
    for(int i =0; i<5; i++){
        [self.objScale.arrFeedback addObject:[NSNumber numberWithInt:1]];
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
    if (avgScoreOfDay <=1.7 )
    {return @"Precontemplation";}
    else if (avgScoreOfDay <= 2.4)
    {return @"Contemplation";}
    else if (avgScoreOfDay  <= 3.25)
    {return @"Preparation";}
    else if (avgScoreOfDay <= 4.25)
    {return @"Action";}
    
    return @"Maintenance";}


-(void)setGoalTitle
{
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %d times/%@", goal.description, goal.numFrequency, goal.frequencyName];
    Goal * objGoal = [[Goal alloc] init];
    
    [objGoal loadData:1];
    [self.txtGoal01 setText:[NSString stringWithFormat:@"%@ - %d times/%@", objGoal.description, objGoal.numFrequency, objGoal.frequencyName]];
    
    [objGoal loadData:2];
    [self.txtGoal02 setText:[NSString stringWithFormat:@"%@ - %d times/%@", objGoal.description, objGoal.numFrequency, objGoal.frequencyName]];
    
    [objGoal loadData:3];
    [self.txtGoal03 setText:[NSString stringWithFormat:@"%@ - %d times/%@", objGoal.description, objGoal.numFrequency, objGoal.frequencyName]];
    
    [objGoal loadData:4];
    [self.txtGoal04 setText:[NSString stringWithFormat:@"%@ - %d times/%@", objGoal.description, objGoal.numFrequency, objGoal.frequencyName]];
    
    [objGoal loadData:5];
    [self.txtGoal05 setText:[NSString stringWithFormat:@"%@ - %d times/%@", objGoal.description, objGoal.numFrequency, objGoal.frequencyName]];
}



@end
