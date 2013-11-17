//
//  SetProfileViewController.h
//  App
//
//  Created by Herman on 11/16/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetProfileViewController : UIViewController
@property UITapGestureRecognizer *tapDismissKeyboard;
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *ageField;
@property (strong, nonatomic) IBOutlet UITextField *weightField;
- (IBAction)endTyping:(id)sender;

@end
