//
//  TodayViewController.h
//  App
//
//  Created by Herman on 11/17/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayViewController : UIViewController
@property (strong, nonatomic) NSArray *quoteArray;
@property (strong, nonatomic) IBOutlet UIButton *motivatedButton;
@property (strong, nonatomic) IBOutlet UILabel *dayLabel;

- (IBAction)btnTapped:(id)sender;


@property (strong, nonatomic) IBOutlet UILabel *quoteLabel;


@end
