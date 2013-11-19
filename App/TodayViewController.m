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
    NSMutableArray *arrFeedback;
    RatingScale * scale;
}
@end

@implementation TodayViewController
int count = 1;

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
    
    self.dayLabel.text = [NSString stringWithFormat:@"%d", count];
    
    self.quoteArray = [[NSArray alloc] initWithObjects:@"Whatever the mind of man can conceive and believe, it can achieve. –Napoleon Hill",@"Your time is limited, so don’t waste it living someone else’s life. –Steve Jobs",@"Strive not to be a success, but rather to be of value. –Albert Einstein",@"Two roads diverged in a wood, and I took the one less traveled by, and that has made all the difference.  –Robert Frost",@"The common question that gets asked in business is, ‘why?’ That’s a good question, but an equally valid question is, ‘why not?’ -Jeffrey Bezos", nil];
    //random generate quote and display quote
    int index = arc4random() %5;
    self.quoteLabel.text = self.quoteArray[index];
    //Wrap Text
    self.quoteLabel.numberOfLines = 0;
    
    //hides the back button
    self.navigationItem.hidesBackButton = YES;
    
    count++;
    
    scale = [[RatingScale alloc]init];
    arrRating = [scale getRating];
    arrFeedback = [scale getFeedback];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
//Action when button tapped
- (IBAction)btnTapped:(id)sender {
    [scale setRating:arrRating];
    
    //code to save the selections...
}



- (IBAction)segRate01:(id)sender {
    NSInteger value = ((UISegmentedControl *)sender).selectedSegmentIndex + 1;
    [arrRating replaceObjectAtIndex:0 withObject:[NSNumber numberWithInt:value]];
    NSLog(@"select %d", value);
}

- (IBAction)segRate02:(id)sender {
    NSInteger value = ((UISegmentedControl *)sender).selectedSegmentIndex + 1;
    [arrRating replaceObjectAtIndex:1 withObject:[NSNumber numberWithInt:value]];
    NSLog(@"select %d", value);
}

- (IBAction)segRate03:(id)sender {
    NSInteger value = ((UISegmentedControl *)sender).selectedSegmentIndex + 1;
    [arrRating replaceObjectAtIndex:2 withObject:[NSNumber numberWithInt:value]];
    NSLog(@"select %d", value);
}

- (IBAction)segRate04:(id)sender {
    NSInteger value = ((UISegmentedControl *)sender).selectedSegmentIndex + 1;
    [arrRating replaceObjectAtIndex:3 withObject:[NSNumber numberWithInt:value]];
    NSLog(@"select %d", value);
}

- (IBAction)segRate05:(id)sender {
    NSInteger value = ((UISegmentedControl *)sender).selectedSegmentIndex + 1;
    [arrRating replaceObjectAtIndex:4 withObject:[NSNumber numberWithInt:value]];
    NSLog(@"select %d", value);
}
@end
