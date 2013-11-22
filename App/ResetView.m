//
//  ResetView.m
//  App
//
//  Created by Huy Nguyen on 11/21/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import "ResetView.h"

@interface ResetView ()

@end

@implementation ResetView

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

- (IBAction)btnReset:(id)sender {
    
    RatingScale * objRatingScale = [[RatingScale alloc]init];
    [objRatingScale resetParameter];
    
    [objRatingScale dayCompleted];
    
    Goal * objGoal = [[Goal alloc]init];
    for(int i =1; i <= 5; i++)
    {
        [objGoal deleteData:i];
    }
    
    
    
}
@end
