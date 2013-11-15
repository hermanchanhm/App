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
    self.goalArray = [[NSArray alloc] initWithObjects:@"Diet",@"Exercise",@"Bad Habit",@"4",@"5", nil];
    self.selectorLabel.text = [NSString stringWithFormat:@"%.f", self.selectorStepper.value];
    
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
            self.choice.text = @"Bad Habit";
            break;
        case 3:
            self.choice.text = @"4";
            break;
        case 4:
            self.choice.text = @"5";
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


@end
