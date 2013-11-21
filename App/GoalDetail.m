//
//  GoalDetail.m
//  App
//
//  Created by Huy Nguyen on 11/21/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import "GoalDetail.h"


@implementation GoalDetail

-(id)init
{
    self = [super init];
    if(self)
    {
        db = [[[DBConnection alloc]init] connectDB] ;
        
    }
    
    return self;
}

-(void)loadGoalDetail:(int)goalID dayValue:(int)requestDay
{
    NSString *querySQL = [NSString stringWithFormat:@"select * from Goal_Detail where Goal_ID = '%d' and Day = %d",goalID, requestDay];
    
    [db open];
    
    FMResultSet *resultSet = [db executeQuery:querySQL];
    
    while([resultSet next])
    {
        [self setID:[resultSet intForColumn:@"ID"]];
        [self setGoal_ID:[resultSet intForColumn:@"Goal_ID"]];
        [self setExecutedDay:[resultSet intForColumn:@"Day"]];
        [self setRatingPoint:[resultSet intForColumn:@"Rating"]];
        [self setFeedbackPoint:[resultSet intForColumn:@"Feedback"]];
        [self setDayScore:[resultSet doubleForColumn:@"Score"]];
        
        NSLog(@"initLoad");
    }
    
    [db close];
}

-(NSMutableArray *)loadGoalDetail:(int)goalID
{
    NSMutableArray * array = [[NSMutableArray alloc]init];
    
    NSString *querySQL = [NSString stringWithFormat:@"select * from Goal_Detail where Goal_ID = %d order by day" ,goalID];
    
    [db open];
    
    FMResultSet *resultSet = [db executeQuery:querySQL];
    
    
    while([resultSet next])
    {
        GoalDetail * objGoalDetail = [[GoalDetail alloc]init];
        [objGoalDetail setID:[resultSet intForColumn:@"ID"]];
        [objGoalDetail setGoal_ID:[resultSet intForColumn:@"Goal_ID"]];
        [objGoalDetail setExecutedDay:[resultSet intForColumn:@"Day"]];
        [objGoalDetail setRatingPoint:[resultSet intForColumn:@"Rating"]];
        [objGoalDetail setFeedbackPoint:[resultSet intForColumn:@"Feedback"]];
        [objGoalDetail setDayScore:[resultSet doubleForColumn:@"Score"]];
        
        [array addObject:objGoalDetail];
        
        NSLog(@"objGoalDetail");
    }
    
    [db close];
    
    return array;
}

-(BOOL)updateGoalDetail
{
    self.dayScore = [self calculateScoreOfDay:[self ratingPoint] feedback:[self feedbackPoint]];
    
    NSString *querySQL = [NSString stringWithFormat:@"update Goal_Detail set Rating = %d, Feedback = %d, Score = %f where Goal_ID = %d and Day = %d",[self ratingPoint], [self feedbackPoint], [self dayScore], [self goal_ID], [self executedDay]];
    [db open];
    
    BOOL result = [db executeUpdate:querySQL];
    
    if(result)
        NSLog(@"update");
    else
        NSLog(@"Error Update");
    
    [db close];
    
    return result;
}


-(BOOL)addGoalDetail
{
    self.dayScore = 1.0;
    
    NSString *querySQL = [NSString stringWithFormat:@"INSERT INTO Goal_Detail (\"Goal_ID\",\"Day\",\"Rating\",\"Feedback\",\"Score\")  VALUES (%d,%d,%d,%d,%f)",[self goal_ID],[self executedDay], [self ratingPoint], [self feedbackPoint], [self dayScore]];
    
    [db open];
    
    BOOL result = [db executeUpdate:querySQL];
    
    if(result)
        NSLog(@"update");
    else
        NSLog(@"Error Update");
    
    [db close];
    
    return result;
}

-(BOOL)removeGoalDetail:(int)removedGoalID
{
    NSString *querySQL = [NSString stringWithFormat:@"delete from Goal_Detail where Goal_ID = %d",removedGoalID];
    
    [db open];
    
    BOOL result = [db executeUpdate:querySQL];
    
    if(result)
        NSLog(@"update");
    else
        NSLog(@"Error Update");
    
    [db close];
    
    return result;
}

//calculate score of each day
-(double)calculateScoreOfDay:(int)ratingScore feedback:(int)feedbackScore
{
    //initialize
    double scoreOfDay = 1.0;
    
    //condition for "NO"
    if(feedbackScore == 1)
    {
        if(ratingScore == 1) //if 1
        {scoreOfDay = 1.0;}
        else if(ratingScore == 2)//if 2
        {scoreOfDay = 1.5;}
        else if (ratingScore == 3) //if 3
        {scoreOfDay = 2.0;}
        else if (ratingScore == 4) //if 4
        {scoreOfDay = 2.5;}
        else //if 5
        {scoreOfDay = 3.0;}
    }
    
    //condition for "KINDA"
    else if(feedbackScore == 2)
    {
        if(ratingScore == 1) //if 1
        {scoreOfDay = 1.0;}
        else if(ratingScore == 2)//if 2
        {scoreOfDay = 1.75;}
        else if (ratingScore == 3) //if 3
        {scoreOfDay = 2.5;}
        else if (ratingScore == 4) //if 4
        {scoreOfDay = 3.25;}
        else //if 5
        {scoreOfDay = 4.0;}
    }
    
    //condition for "YES" (feedbackScre == 3)
    else
    {
        if(ratingScore == 1) //if 1
        {scoreOfDay = 1.0;}
        else if(ratingScore == 2)//if 2
        {scoreOfDay = 2.0;}
        else if (ratingScore == 3) //if 3
        {scoreOfDay = 3.0;}
        else if (ratingScore == 4) //if 4
        {scoreOfDay = 4.0;}
        else //if 5
        {scoreOfDay = 5.0;}
    }
    
    return scoreOfDay;
}

-(NSMutableArray *)loadGoalDetailbyDay:(int)requestedDay
{
    NSMutableArray * array = [[NSMutableArray alloc]init];
    
    NSString *querySQL = [NSString stringWithFormat:@"select * from Goal_Detail where day = %d order by Goal_ID" ,requestedDay];
    
    [db open];
    
    FMResultSet *resultSet = [db executeQuery:querySQL];
    
    while([resultSet next])
    {
        GoalDetail * objGoalDetail = [[GoalDetail alloc]init];

        [objGoalDetail setID:[resultSet intForColumn:@"ID"]];
        [objGoalDetail setGoal_ID:[resultSet intForColumn:@"Goal_ID"]];
        [objGoalDetail setExecutedDay:[resultSet intForColumn:@"Day"]];
        [objGoalDetail setRatingPoint:[resultSet intForColumn:@"Rating"]];
        [objGoalDetail setFeedbackPoint:[resultSet intForColumn:@"Feedback"]];
        [objGoalDetail setDayScore:[resultSet doubleForColumn:@"Score"]];
        
        [array addObject:objGoalDetail];
        
        NSLog(@"objGoalDetail");
    }
    
    [db close];
    
    return array;
}

@end
