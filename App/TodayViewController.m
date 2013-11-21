//
//  TodayViewController.m
//  App
//
//  Created by Herman on 11/17/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import "TodayViewController.h"

@interface TodayViewController ()
{
    NSMutableArray *arrRating;
    RatingScale * scale;
    TodayPMViewController *todayPMView;
    int count;
}
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
   
    //set title as today's date
        //format date
    scale = [[RatingScale alloc]init];
    arrRating = [scale getRating];
    [self setCurrentRating];
    count = [scale getDayCount];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd"];
    //date for today
    NSDate *today = [[NSDate alloc] init];
    
    self.navigationItem.title = [NSString stringWithFormat: @"Today - %@",[dateFormatter stringFromDate:today]];
    
    self.dayLabel.text = [NSString stringWithFormat:@"Day %d", count];
    //end
    
    self.quoteArray = [[NSArray alloc] initWithObjects:@"Whatever the mind of man can conceive and believe, it can achieve. –Napoleon Hill",@"Your time is limited, so don’t waste it living someone else’s life. –Steve Jobs",@"Strive not to be a success, but rather to be of value. –Albert Einstein",@"Two roads diverged in a wood, and I took the one less traveled by, and that has made all the difference.  –Robert Frost",@"The common question that gets asked in business is, ‘why?’ That’s a good question, but an equally valid question is, ‘why not?’ -Jeffrey Bezos", nil];
    //random generate quote and display quote
    int index = arc4random() %5;
    self.quoteLabel.text = self.quoteArray[index];
    //Wrap Text
    self.quoteLabel.numberOfLines = 0;
    
    //hides the back button
    self.navigationItem.hidesBackButton = YES;
    
    //count++;
    //count = 0;
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
//Action when button tapped
- (IBAction)btnTapped:(id)sender {
    
    //Store the rating info
    [self getCurrentRating];
    [scale setRating:arrRating];
    
    
    //navigate to TodayPMViewController
    
    if( todayPMView == nil)
    {
        todayPMView = [self.storyboard instantiateViewControllerWithIdentifier:@"tonightVC"];
        //self.todayPMView.to = self;
        count++;
        NSLog(@"View count : %d", count);
    }
    
    
    [self.navigationController pushViewController:todayPMView animated:YES];
    //[self.navigationController popViewControllerAnimated:YES];
    
    //code to save the selections...
}

-(void)resetArrayRating{
    [arrRating removeAllObjects];
    
    for(int i =0; i<5; i++){
        [arrRating addObject:[NSNumber numberWithInt:1]];
    }
}

-(void)getCurrentRating{
    [self resetArrayRating];
    
    NSInteger value;
    
    value = [[self ratingSegment01]selectedSegmentIndex] + 1;
    [arrRating replaceObjectAtIndex:0 withObject:[NSNumber numberWithInt:value]];
    
    value = [[self ratingSegment02]selectedSegmentIndex] + 1;
    [arrRating replaceObjectAtIndex:1 withObject:[NSNumber numberWithInt:value]];
    
    value = [[self ratingSegment03]selectedSegmentIndex] + 1;
    [arrRating replaceObjectAtIndex:2 withObject:[NSNumber numberWithInt:value]];
    
    value = [[self ratingSegment04]selectedSegmentIndex] + 1;
    [arrRating replaceObjectAtIndex:3 withObject:[NSNumber numberWithInt:value]];
    
    value = [[self ratingSegment05]selectedSegmentIndex] + 1;
    [arrRating replaceObjectAtIndex:4 withObject:[NSNumber numberWithInt:value]];

}

-(void)setCurrentRating{
    self.ratingSegment01.selectedSegmentIndex = [[arrRating objectAtIndex:0] intValue];
    self.ratingSegment01.selectedSegmentIndex = [[arrRating objectAtIndex:1] intValue];
    self.ratingSegment01.selectedSegmentIndex = [[arrRating objectAtIndex:2] intValue];
    self.ratingSegment01.selectedSegmentIndex = [[arrRating objectAtIndex:3] intValue];
    self.ratingSegment01.selectedSegmentIndex = [[arrRating objectAtIndex:4] intValue];
}


- (IBAction)segRate01:(id)sender {}

- (IBAction)segRate02:(id)sender {}

- (IBAction)segRate03:(id)sender {}

- (IBAction)segRate04:(id)sender {}

- (IBAction)segRate05:(id)sender {}
@end
