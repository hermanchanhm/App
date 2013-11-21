//
//  RatingScale.h
//  App
//
//  Created by Huy Nguyen on 11/18/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBConnection.h"
#import "Goal.h"

@interface RatingScale : NSObject
{
    FMDatabase *db;
    NSMutableArray *arrRating;
    NSMutableArray *arrFeedback;
    int dayCount;
}

-(NSMutableArray *)getRating;
-(NSMutableArray *)getFeedback;

-(void)setRating:(NSMutableArray *)newRating;
-(void)setFeedback:(NSMutableArray *)newFeedback;
-(int)getDayCount;
-(void)dayCompleted;
@end
