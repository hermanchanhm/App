//
//  WidgetViewController.m
//  App
//
//  Created by Herman on 11/14/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import "WidgetViewController.h"

@interface WidgetViewController ()
{
    Widget * _widget;
}
@end

@implementation WidgetViewController

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
    _widget = [[Widget alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)selectWidget:(NSString *)widgetName{
    [_widget setWidget:widgetName];
    [[self txtTitle]setText:[_widget getWidget]];
}

- (IBAction)btnWidget01:(id)sender {
    [self selectWidget:@"squirtle1.png"];
}

- (IBAction)btnWidget02:(id)sender {
    [self selectWidget:@"machop1.png"];
}

- (IBAction)btnWidget03:(id)sender {
    [self selectWidget:@"pikachu1.png"];
}

- (IBAction)btnWidget04:(id)sender {
    [self selectWidget:@"charmander1.png"];
}

@end
