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
- (void)viewDidAppear:(BOOL)animated
{
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
    
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Not Enough Exp."
                                                          message:@"You have to reach xxx Exp. to evolve"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];

    //}
    
    
}
@end
