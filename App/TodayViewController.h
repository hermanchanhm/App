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
#import "Goal.h"
#import "AppStage.h"

@interface TodayViewController : UIViewController

@property (strong, nonatomic) RatingScale *objScale;

@property (strong, nonatomic) NSArray *quoteArray;
@property (strong, nonatomic) IBOutlet UIButton *motivatedButton;
@property (strong, nonatomic) IBOutlet UILabel *dayLabel;
@property (strong, nonatomic) IBOutlet UILabel *quoteLabel;

@property (strong, nonatomic) IBOutlet UISegmentedControl *ratingSegment01;
@property (strong, nonatomic) IBOutlet UISegmentedControl *ratingSegment02;
@property (strong, nonatomic) IBOutlet UISegmentedControl *ratingSegment03;
@property (strong, nonatomic) IBOutlet UISegmentedControl *ratingSegment04;
@property (strong, nonatomic) IBOutlet UISegmentedControl *ratingSegment05;

@property (strong, nonatomic) IBOutlet UILabel *txtGoal01;

@property (strong, nonatomic) IBOutlet UILabel *txtGoal02;
@property (strong, nonatomic) IBOutlet UILabel *txtGoal03;
@property (strong, nonatomic) IBOutlet UILabel *txtGoal04;
@property (strong, nonatomic) IBOutlet UILabel *txtGoal05;







- (IBAction)btnTapped:(id)sender;



@end
