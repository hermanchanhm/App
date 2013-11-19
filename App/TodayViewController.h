//
//  TodayViewController.h
//  App
//
//  Created by Herman on 11/17/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingScale.h"

@interface TodayViewController : UIViewController

@property (strong, nonatomic) NSArray *quoteArray;
@property (strong, nonatomic) IBOutlet UIButton *motivatedButton;
@property (strong, nonatomic) IBOutlet UILabel *dayLabel;

- (IBAction)btnTapped:(id)sender;


@property (strong, nonatomic) IBOutlet UILabel *quoteLabel;

- (IBAction)segRate01:(id)sender;
- (IBAction)segRate02:(id)sender;
- (IBAction)segRate03:(id)sender;
- (IBAction)segRate04:(id)sender;
- (IBAction)segRate05:(id)sender;

@end
