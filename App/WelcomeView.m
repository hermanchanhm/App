//
//  WelcomeView.m
//  App
//
//  Created by Huy Nguyen on 11/17/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import "WelcomeView.h"

@interface WelcomeView ()

@end

@implementation WelcomeView

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnStart:(id)sender {
    Widget *widget = [[Widget alloc]init];
    if( ([widget getWidget] == nil) || ([[widget getWidget]isEqualToString:@""]))  {
        if(self.widgetView ==nil)
            self.widgetView = [self.storyboard instantiateViewControllerWithIdentifier:@"widgetView"];
        [self.navigationController pushViewController:self.widgetView animated:YES];
    }else
    {
        if(self.setGoalView ==nil)
            self.setGoalView = [self.storyboard instantiateViewControllerWithIdentifier:@"setGoalView"];
        [self.navigationController pushViewController:self.setGoalView animated:YES];
    }
}
@end
