//
//  SetProfileViewController.m
//  App
//
//  Created by Herman on 11/16/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import "SetProfileViewController.h"

@interface SetProfileViewController ()

@end

@implementation SetProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Add Tap Gesture Recognizer
    UITapGestureRecognizer *tapDismissKeyboard = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector (hideKeyboard)];
    
    [self.view addGestureRecognizer:tapDismissKeyboard];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//method with UITapGrstureRecognizer to hide keyboard
-(void)hideKeyboard {
    [self.nameField resignFirstResponder];
    //add code for saving changes
    [self.ageField resignFirstResponder];
    //add code for saving changes
    [self.weightField resignFirstResponder];
    
}


- (IBAction)endTyping:(id)sender {
    [sender resignFirstResponder];
    //add code for changes
}
@end
