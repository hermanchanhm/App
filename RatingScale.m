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
    arrRating = [[NSMutableArray alloc]init];
     arrFeedback = [[NSMutableArray alloc]init];
    db = [[[DBConnection alloc]init] connectDB];
    [self loadData:@"Rating" arrayName:arrRating];
    [self loadData:@"Feedback" arrayName:arrFeedback];
    dayCount = [self loadDayCount];
    return self;
}

/*
 NSNumber anumber = [yourArray objectAtIndex:6];
 int yourInteger = [anumber intValue];
 */



-(NSMutableArray *)getRating{
    if(arrRating.count<=0)
        for(int i = 0;i < 5; i++)
            [arrRating addObject:[NSNumber numberWithInt:1]];
    return arrRating;
}

-(NSMutableArray *)getFeedback{
    if(arrFeedback.count<=0)
        for(int i = 0;i < 5; i++)
            [arrFeedback addObject:[NSNumber numberWithInt:1]];

    return arrFeedback;
}

-(void)setRating:(NSMutableArray *)newRating{
    arrRating = newRating;
    [self updateData:@"Rating" arrayName:arrRating];
 
}

-(void)setFeedback:(NSMutableArray *)newFeedback{
    arrFeedback = newFeedback;
    [self updateData:@"Feedback" arrayName:arrFeedback];
}

-(void)loadData:(NSString *)paramName arrayName:(NSMutableArray *)array
{
    NSString *querySQL = [NSString stringWithFormat:@"select * from parameter where name = '%@'",paramName];
    
    [db open];
    
    FMResultSet *resultSet = [db executeQuery:querySQL];
 
    if([resultSet next])
    {
        int point;
        NSNumber *num;
        NSInteger value;
        
        value = [resultSet intForColumn:@"Value"];
        [array removeAllObjects];
        while(value>0)
        {
            point = value%10;
            num = [NSNumber numberWithInt:point];
            [array addObject:num];
            value = value/10;
        }
    }
    
    [db close];
}

-(BOOL)updateData:(NSString *)paramName arrayName:(NSMutableArray *)array
{
    NSString *newValue =[array componentsJoinedByString:@""];;
    NSString *querySQL = [NSString stringWithFormat:@"update parameter set value = '%@' where name = '%@'",newValue, paramName];
    [db open];
    
    BOOL result = [db executeUpdate:querySQL];
    
    if(result)
        NSLog(@"update");
    else
        NSLog(@"Error Update");
    
    [db close];
    
    return result;
}

-(int)getDayCount{
    return dayCount;
}

-(int)loadDayCount{
    NSString *querySQL = [NSString stringWithFormat:@"select * from parameter where name = 'DayCount'"];
    int value = 1;
    [db open];
    
    FMResultSet *resultSet = [db executeQuery:querySQL];
    
    if([resultSet next])
    {
        value = [resultSet intForColumn:@"Value"];
        
    }
    
    [db close];
    
    return value;
}

-(void)dayCompleted{
    NSString *querySQL;
    
    //update day count
    querySQL= [NSString stringWithFormat:@"update parameter set value = '%d' where name = 'DayCount'",(dayCount+1)];
    [db open];
    [db executeUpdate:querySQL];
    [db close];
    
    //store feedback
    [self setFeedback:arrFeedback];
    
    
    //update the data of current day to goal point
    Goal * objGoal = [[Goal alloc]init];
    int point,feedback;
    [self loadData:@"Rating" arrayName:arrRating];
    [self loadData:@"Feedback" arrayName:arrFeedback];
    
    for(int i = 0; i<5; i++)
    {
        point = 0;
        [objGoal loadData:i+1];
        //if(objGoal.enable == 0)
        //    continue;
        point = objGoal.point + [[arrRating objectAtIndex:i] intValue];
        feedback = objGoal.feedback + [[arrFeedback objectAtIndex:i] intValue];
        
        [objGoal setPoint:point];
        [objGoal setFeedback:feedback];
        
        [objGoal updateData];
        
    }
    
    querySQL= [NSString stringWithFormat:@"update parameter set value = '11111' where name = 'Rating' or name ='Feedback'"];
    [db open];
    [db executeUpdate:querySQL];
    [db close];
    
}

@end
