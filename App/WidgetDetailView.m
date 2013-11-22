//
//  WidgetDetailView.m
//  App
//
//  Created by Huy Nguyen on 11/18/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import "WidgetDetailView.h"

@interface WidgetDetailView ()

@end

@implementation WidgetDetailView

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
    
    //check exp then load appropriate image...
}

- (double)calTotal
{
    RatingScale * obj = [[RatingScale alloc]init];
    int days = [obj getDayCount];
    double totalpointdisplay = 0;
    for (int i = 1; i < days+1; i++)
    {
        Goal * op = [[Goal alloc]initWithGoalID:i];
        double V = [op getAvgOfScores:i]*10;
        totalpointdisplay += V;
    }
    return totalpointdisplay;
}
- (void)viewDidAppear:(BOOL)animated
{
    
    double total = [self calTotal];
    NSString *theValue = [NSString stringWithFormat:@"%.0f", total];
    self.expLabel.text = theValue;
    Widget * objWidget = [[Widget alloc]init];
    
    
    [self.icon setImage:[UIImage imageNamed:[objWidget getWidget]]];
    [self.real setImage:[UIImage imageNamed:[objWidget getWidget]]];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnEvolveTapped:(id)sender {
    //check if the score to evolve reached
    /*if (exp reached) {
        //notify user changes
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Congratulations!"
                                                          message:@"You have to evolved to Lv. X"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
     
        //update levelLabel to new level
        //update expLabel to new Exp
        //update widget image
    } else { */
        //notify user changes
        Widget * objWidget = [[Widget alloc]init];
    NSString * str = [objWidget getWidget];
    if ([self calTotal] >= 1000){
        
    
    if ([str isEqualToString:@"machop1.png"]){
        [self.real setImage:[UIImage imageNamed:@"machop2.png"]];
        [self.icon setImage:[UIImage imageNamed:@"machop2.png"]];}
    if ([str isEqualToString:@"pikachu1.png"]){
        [self.icon setImage:[UIImage imageNamed:@"pikachu2.png"]];
        [self.real setImage:[UIImage imageNamed:@"pikachu2.png"]];}
    if ([str isEqualToString:@"squirtle1.png"]){
        [self.icon setImage:[UIImage imageNamed:@"squirtle2.png"]];
        [self.real setImage:[UIImage imageNamed:@"squirtle2.png"]];}
    if ([str isEqualToString:@"charmander1.png"]){
        [self.real setImage:[UIImage imageNamed:@"charmander2.png"]];
        [self.icon setImage:[UIImage imageNamed:@"charmander2.png"]];}
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Enough Exp for evolution."
                                                          message:@"Congradulations!Your widget has evolved!"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    
    }
    else{
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Not Enough Exp."
                                                          message:@"You have to reach 1000 Exp. to evolve"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];

    //}
    }
    
}
@end
