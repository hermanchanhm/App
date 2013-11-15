//
//  Goal1ViewController.h
//  App
//
//  Created by Herman on 11/14/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Goal1ViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *choice;
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) NSArray *goalArray;
@property (strong, nonatomic) IBOutlet UIStepper *selectorStepper;
@property (strong, nonatomic) IBOutlet UILabel *selectorLabel;
@property (strong, nonatomic) IBOutlet UITextField *goalTextField;

- (IBAction)valueChanged:(id)sender;

- (IBAction)finishTypeGoal:(id)sender;

@end
