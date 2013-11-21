//
//  RatingScale.m
//  App
//
//  Created by Huy Nguyen on 11/18/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import "RatingScale.h"

@implementation RatingScale

-(id)init{
    self.arrRating = [[NSMutableArray alloc]init];
    self.arrFeedback = [[NSMutableArray alloc]init];
    db = [[[DBConnection alloc]init] connectDB];
    dayCount = [self getDayCount];
    [self loadData:dayCount];
   
    return self;
}

/*
 NSNumber anumber = [yourArray objectAtIndex:6];
 int yourInteger = [anumber intValue];
 */

-(void)resetArray:(NSMutableArray *)array{
    [array removeAllObjects];
    for(int i = 0;i < 5; i++)
        [array addObject:[NSNumber numberWithInt:1]];
}

-(NSMutableArray *)getRating{
    if(self.arrRating.count<=0)
        [self resetArray:self.arrRating];
    return self.arrRating;
}

-(NSMutableArray *)getFeedback{
    if(self.arrFeedback.count<=0)
        [self resetArray:self.arrFeedback];
    return self.arrFeedback;
}

-(void)setRating{
    [self updateData:@"Rating" paramDay:dayCount arrayArray:self.arrRating];
}

-(void)setFeedback{
    [self updateData:@"Feedback" paramDay:dayCount arrayArray:self.arrFeedback];
}

-(void)reloadData{
    [self loadData:dayCount];
}

-(void)loadData:(int)requiredDay
{
    GoalDetail * objGoalDetail = [[GoalDetail alloc]init];
    NSMutableArray * temp = [objGoalDetail loadGoalDetailbyDay:requiredDay];
    
    if(temp == nil || temp.count <5 )
    {
        [self resetArray:self.arrRating];
        [self resetArray:self.arrFeedback];
        return;
    }
    
    [self.arrFeedback removeAllObjects];
    [self.arrRating removeAllObjects];
    
    for(int i = 0; i<5; i++)
    {
        objGoalDetail = [temp objectAtIndex:i];
        [self.arrRating addObject:[NSNumber numberWithInt:objGoalDetail.ratingPoint]];
        [self.arrFeedback addObject:[NSNumber numberWithInt:objGoalDetail.feedbackPoint]];
    }
    
}

-(BOOL)updateData:(NSString *)paramName paramDay:(int)requiredDay arrayArray:(NSMutableArray *)array
{
    GoalDetail * objGoalDetail = [[GoalDetail alloc]init];
    NSMutableArray * temp = [objGoalDetail loadGoalDetailbyDay:requiredDay];
    
    if(temp == nil || temp.count <5)
    {
        return false;
    }
    
    for(int i = 0; i<5; i++)
    {
        
        objGoalDetail = [temp objectAtIndex:i];
        if([paramName isEqualToString:@"Rating"])
        {
            objGoalDetail.ratingPoint = [[array objectAtIndex:i] intValue];
        }
        else if ([paramName isEqualToString:@"Feedback"])
        {
            objGoalDetail.feedbackPoint = [[array objectAtIndex:i] intValue];
        }
        
        [objGoalDetail updateGoalDetail];

    }
    
    return true;
}


-(int)getDayCount{
    NSString *querySQL = [NSString stringWithFormat:@"select * from parameter where name = 'DayCount'"];
    int value = 1;
    
    [db open];
    FMResultSet *resultSet = [db executeQuery:querySQL];
    if([resultSet next]){
        value = [resultSet intForColumn:@"Value"];
    }
    [db close];
    
    dayCount = value;
        
    return value;
}

-(void)dayCompleted{
    NSString *querySQL;
    
    //update day count
    dayCount = [self getDayCount] + 1;
    
    querySQL= [NSString stringWithFormat:@"update parameter set value = '%d' where name = 'DayCount'",(dayCount)];
    [db open];
    [db executeUpdate:querySQL];
    [db close];
    
    //create new pattern on Goal_Detail for new day
    GoalDetail * objGoalDetail = [[GoalDetail alloc]init];
    
    for(int i = 1; i<=5; i++)
    {
        [objGoalDetail setGoal_ID:i];
        [objGoalDetail setExecutedDay:(dayCount)];
        [objGoalDetail setRatingPoint:1];
        [objGoalDetail setFeedbackPoint:1];
        [objGoalDetail setDayScore:1.0];
        
        [objGoalDetail addGoalDetail];

    }
    
    [self resetArray:[self arrRating]];
    [self resetArray:[self arrFeedback]];
}

@end
