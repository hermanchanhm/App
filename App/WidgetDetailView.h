//
//  WidgetDetailView.h
//  App
//
//  Created by Huy Nguyen on 11/18/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WidgetDetailView : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *btnEvolve;
- (IBAction)btnEvolveTapped:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *expLabel;
@property (strong, nonatomic) IBOutlet UILabel *levelLabel;
@property (strong, nonatomic) IBOutlet UIButton *btnWidget;

@end
