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
    return self;
}

/*
 NSNumber anumber = [yourArray objectAtIndex:6];
 int yourInteger = [anumber intValue];
 */



-(NSMutableArray *)getRating{
    return arrRating;
}

-(NSMutableArray *)getFeedback{
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
    NSString *querySQL = [NSString stringWithFormat:@"select * from parameter where id = '%@'",paramName];
    
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
    NSString *newValue;
    
    for( int i = 0; i< array.count; i++)
    {
        [newValue stringByAppendingString:[NSString stringWithFormat:@"%d", [[array objectAtIndex:i] intValue]]];
    }
    
    NSString *querySQL = [NSString stringWithFormat:@"update goal set value = '%@' where id = %@",newValue, paramName];
    [db open];
    
    BOOL result = [db executeUpdate:querySQL];
    
    if(result)
        NSLog(@"update");
    else
        NSLog(@"Error Update");
    
    [db close];
    
    return result;
}

@end
