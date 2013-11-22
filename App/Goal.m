//
//  Goal.m
//  testApp
//
//  Created by Huy Nguyen on 11/17/13.
//  Copyright (c) 2013 Huy Nguyen. All rights reserved.
//

#import "Goal.h"

@implementation Goal

-(id)init
{
    self = [super init];
    if(self)
    {
        //DBConnection *con= [[DBConnection alloc]init];
        //db = [con connectDB];
        db = [[[DBConnection alloc]init] connectDB] ;

    }
    
    return self;
}


-(id)initWithGoalID:(int)goalID
{
    self = [super init];
    if(self)
    {
       // DBConnection *con= [[DBConnection alloc]init];
        //db = [con connectDB];
        db = [[[DBConnection alloc]init] connectDB] ;
        [self loadData:goalID];
    }
    
    return self;
}


-(void)loadData:(int)goalID
{
    NSString *querySQL = [NSString stringWithFormat:@"select * from goal where id = '%d'",goalID];
    
    [db open];
    
    
    FMResultSet *resultSet = [db executeQuery:querySQL];
    
    while([resultSet next])
    {
        [self setID:goalID];
        [self setName:[resultSet stringForColumn:@"name"]];
        if(self.name == nil) self.name = @"";
        [self setDescription:[resultSet stringForColumn:@"description"]];
        if(self.description == nil) self.description = @"";
        [self setPoint:[resultSet intForColumn:@"point"]];
        [self setFeedback:[resultSet intForColumn:@"Feedback"]];
        [self setEnable:[resultSet intForColumn:@"Enable"]];
        [self setSelecFrequency:[resultSet intForColumn:@"SelectFrequency"]];
        [self setNumFrequency:[resultSet intForColumn:@"NumFrequency"]];
        
        if(self.selecFrequency == 0)
            [self setFrequencyName:@"day"];
        else
            [self setFrequencyName:@"week"];
        
        
        NSLog(@"initLoad");
    }
    
    [db close];
}

-(BOOL)updateData
{
    NSString *querySQL = [NSString stringWithFormat:@"update goal set name = '%@', description = '%@', point = %d, feedback = %d, enable = %d, SelectFrequency = %d, NumFrequency = %d where id = %d",[self name],[self description],[self point],[self feedback],[self enable],[self selecFrequency], [self numFrequency] ,[self ID]];
    
    [db open];
    
    BOOL result = [db executeUpdate:querySQL];
    
    if(result)
        NSLog(@"update");
    else
        NSLog(@"Error Update");
    
    [db close];
    
    return result;
}

-(BOOL)deleteData:(int)goalID
{
    self.ID= goalID;
    self.name = [NSString stringWithFormat:@"<Goal %d>",goalID];
    self.description = @"";
    self.point =0;
    self.feedback = 0;
    self.enable = 0;
    self.selecFrequency = 0;
    self.numFrequency = 0;
    return [self updateData];
}

-(int)getEnableGoal{
    NSString *querySQL = [NSString stringWithFormat:@"select count() from goal where enable = 1"];
    int count = 0;
    [db open];
    
    FMResultSet *resultSet = [db executeQuery:querySQL];
    
    if([resultSet next])
        count = [resultSet intForColumnIndex:0];
    
    [db close];
    
    return count;
}

-(double)getAvgOfScores:(int)goalID
{
    double avgValue=0.0;
    
    NSString *querySQL = [NSString stringWithFormat:@"select avg(Score) from Goal_Detail where Goal_ID = '%d'",goalID];
    
    [db open];
    
    FMResultSet *resultSet = [db executeQuery:querySQL];
    
    if([resultSet next])
    {
        avgValue = [resultSet doubleForColumnIndex:0];
    }
    
    [db close];
    
    return avgValue;
}


-(double)getAvgOfScores
{
    double avgValue=0.0;
    
    NSString *querySQL = [NSString stringWithFormat:@"select avg(Score) from Goal_Detail where Goal_ID = '%d'",self.ID];
    
    [db open];
    
    FMResultSet *resultSet = [db executeQuery:querySQL];
    
    if([resultSet next])
    {
        avgValue = [resultSet doubleForColumnIndex:0];
    }
    
    [db close];
    
    return avgValue;
}

-(NSString *)stageOfChange
{
    double avgScoreOfDay = [self getAvgOfScores:self.ID];
    if (avgScoreOfDay <=1.7 )
    {return @"Precontemplation";}
    else if (avgScoreOfDay <= 2.4)
    {return @"Contemplation";}
    else if (avgScoreOfDay  <= 3.25)
    {return @"Preparation";}
    else if (avgScoreOfDay <= 4.25)
    {return @"Action";}
    
    return @"Maintenance";
}



@end
