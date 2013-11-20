//
//  TodayViewController.h
//  App
//
//  Created by Herman on 11/17/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingScale.h"
#import "TodayPMViewController.h"

@interface TodayViewController : UIViewController

//@property (strong, nonatomic) TodayPMViewController *todayPMView;

@property (strong, nonatomic) NSArray *quoteArray;
@property (strong, nonatomic) IBOutlet UIButton *motivatedButton;
@property (strong, nonatomic) IBOutlet UILabel *dayLabel;

@property (strong, nonatomic) IBOutlet UILabel *quoteLabel;

@property (strong, nonatomic) IBOutlet UISegmentedControl *ratingSegment01;
@property (strong, nonatomic) IBOutlet UISegmentedControl *ratingSegment02;
@property (strong, nonatomic) IBOutlet UISegmentedControl *ratingSegment03;
@property (strong, nonatomic) IBOutlet UISegmentedControl *ratingSegment04;
@property (strong, nonatomic) IBOutlet UISegmentedControl *ratingSegment05;


- (IBAction)btnTapped:(id)sender;

- (IBAction)segRate01:(id)sender;
- (IBAction)segRate02:(id)sender;
- (IBAction)segRate03:(id)sender;
- (IBAction)segRate04:(id)sender;
- (IBAction)segRate05:(id)sender;


//test code...

@property (strong, nonatomic) IBOutlet UISegmentedControl *goal1SegmentControl;
@property (strong, nonatomic) IBOutlet UISegmentedControl *goal2SegmentControl;
@property (strong, nonatomic) IBOutlet UISegmentedControl *goal3SegmentControl;
@property (strong, nonatomic) IBOutlet UISegmentedControl *goal4SegmentControl;
@property (strong, nonatomic) IBOutlet UISegmentedControl *goal5SegmentControl;



@end
