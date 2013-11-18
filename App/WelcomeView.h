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

@interface WelcomeView : UIViewController

@property (weak, nonatomic) WidgetViewController *widgetView;
@property (weak, nonatomic) SetGoalView *setGoalView;

- (IBAction)btnStart:(id)sender;

@end
