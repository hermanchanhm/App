//
//  GoalDetail.h
//  App
//
//  Created by Huy Nguyen on 11/21/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBConnection.h"



@interface GoalDetail : NSObject
{
    FMDatabase * db ;
}

@property (nonatomic) int ID;
@property (nonatomic) int goal_ID;
@property (nonatomic) int executedDay;
@property (nonatomic) int ratingPoint;
@property (nonatomic) int feedbackPoint;
@property (nonatomic) double dayScore;


-(void)loadGoalDetail:(int)goalID dayValue:(int)requestDay;
-(NSMutableArray *)loadGoalDetail:(int)goalID;
-(BOOL)updateGoalDetail;
-(BOOL)addGoalDetail;
-(NSMutableArray *)loadGoalDetailbyDay:(int)requestedDay;
-(BOOL)removeGoalDetail:(int)removedGoalID;

-(NSMutableArray *)getScoreData:(int)goalID;
-(int)getDayCount:(int)goalID;

@end
