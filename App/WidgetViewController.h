//
//  WidgetViewController.h
//  App
//
//  Created by Herman on 11/14/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Widget.h"

@interface WidgetViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *txtTitle;

- (IBAction)btnWidget01:(id)sender;
- (IBAction)btnWidget02:(id)sender;
- (IBAction)btnWidget03:(id)sender;
- (IBAction)btnWidget04:(id)sender;

@end
