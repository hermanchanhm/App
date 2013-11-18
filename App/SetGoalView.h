//
//  SetGoalView.h
//  App
//
//  Created by Huy Nguyen on 11/18/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Goal.h"
#import "Goal1ViewController.h"

@interface SetGoalView : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray * arrayOfGoals;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) Goal1ViewController * goalDetailView;

@end
