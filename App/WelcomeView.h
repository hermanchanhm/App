//
//  WelcomeView.h
//  App
//
//  Created by Huy Nguyen on 11/17/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Widget.h"
#import "WidgetViewController.h"
#import "SetGoalView.h"
#import "TodayViewController.h"

@interface WelcomeView : UIViewController

@property (strong, nonatomic) WidgetViewController *widgetView;
@property (strong, nonatomic) SetGoalView *setGoalView;
@property (strong, nonatomic) TodayViewController *todayView;

- (IBAction)btnStart:(id)sender;

@end
