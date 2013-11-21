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
{
    //TodayPMViewController *todayPMView;
}

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



@end
