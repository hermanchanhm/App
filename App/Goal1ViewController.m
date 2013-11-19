//
//  Goal1ViewController.m
//  App
//
//  Created by Herman on 11/14/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import "Goal1ViewController.h"

@interface Goal1ViewController ()

@end

@implementation Goal1ViewController

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
	// Do any additional setup after loading the view.
    self.goalArray = [[NSArray alloc] initWithObjects:@"Diet",@"Exercise",@"Bad Habits",@"Take Your Meds!",@"Monitoring", nil];
    self.selectorLabel.text = [NSString stringWithFormat:@"%.f", self.selectorStepper.value];
    
    //Select default row as first row
    [self.picker selectRow:0 inComponent:0 animated:YES];
    
    //Add Tap Gesture Recognizer
    UITapGestureRecognizer *tapDismissKeyboard = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector (hideKeyboard)];
    
    [self.view addGestureRecognizer:tapDismissKeyboard];
    
    // or just add: [self.view endEditing:YES];
    [self loadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return 5;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [self.goalArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
{
    switch(row)
    {
            
        case 0:
            self.choice.text = @"Diet";
            break;
        case 1:
            self.choice.text = @"Exercise";
            break;
        case 2:
            self.choice.text = @"Bad Habits";
            break;
        case 3:
            self.choice.text = @"Take Your Meds!";
            break;
        case 4:
            self.choice.text = @"Monitoring";
            break;
    }
}
//Change the value of the UILabel *selectorLabel
- (IBAction)valueChanged:(id)sender {
    self.selectorLabel.text = [NSString stringWithFormat:@"%.f", self.selectorStepper.value];
}

- (IBAction)finishTypeGoal:(id)sender {
    [sender resignFirstResponder];
}

-(void)hideKeyboard {
    [self.goalTextField resignFirstResponder];
    
}

-(void)loadData
{
    if(_objGoal.name == nil)
        [[self choice]setText:@"Define your Goal"];
    else
        [[self choice]setText:_objGoal.name];
    
    [[self goalTextField]setText:_objGoal.description];
    
    self.title = _objGoal.name;
}


@end
