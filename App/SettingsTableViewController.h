//
//  SettingsTableViewController.h
//  App
//
//  Created by Herman on 11/16/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Goal.h"
#import "GoalDetail.h"
#import "RatingScale.h"

@interface SettingsTableViewController : UITableViewController <UIActionSheetDelegate>

@property (nonatomic, strong) NSArray *settingsArray;

@end
