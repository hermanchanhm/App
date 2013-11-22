//
//  GraphViewController.h
//  App
//
//  Created by Craig Steinke on 11/21/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-cocoaTouch.h"
#import "GoalDetail.h"

@interface GraphViewController : UIViewController <CPTPlotDataSource>

@property (nonatomic, strong) CPTGraphHostingView *hostView;

@end
