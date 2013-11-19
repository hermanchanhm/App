//
//  SetNotificationsViewController.h
//  App
//
//  Created by Herman on 11/18/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetNotificationsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIDatePicker *AMPicker;
@property (strong, nonatomic) IBOutlet UIDatePicker *PMPicker;
@property (strong, nonatomic) IBOutlet UIButton *btnUpdate;
- (IBAction)updateTapped:(id)sender;

@end
