//
//  TodayPMViewController.h
//  App
//
//  Created by Herman on 11/18/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingScale.h"

@interface TodayPMViewController : UIViewController

@property (strong, nonatomic) RatingScale * objScale;

@property (strong, nonatomic) IBOutlet UIButton *btnEndDay;

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentFb01;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentFb02;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentFb03;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentFb04;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentFb05;



- (IBAction)btnEndDayTapped:(id)sender;



@end
