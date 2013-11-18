//
//  InitNotificationsViewController.h
//  App
//
//  Created by Herman on 11/18/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InitNotificationsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIDatePicker *AMPicker;
@property (strong, nonatomic) IBOutlet UIDatePicker *PMPicker;
@property (strong, nonatomic) IBOutlet UIButton *btnNext;
- (IBAction)nextTapped:(id)sender;

@end
