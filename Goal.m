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
        [self setName:[resultSet stringForColumn:@"name"]];
        [self setDescription:[resultSet stringForColumn:@"description"]];
        [self setPoint:[resultSet intForColumn:@"point"]];
        [self setFeedback:[resultSet intForColumn:@"Feedback"]];
        [self setEnable:[resultSet intForColumn:@"Enable"]];
        
        NSLog(@"initLoad");
    }
    
    [db close];
}

-(BOOL)updateData
{
    NSString *querySQL = [NSString stringWithFormat:@"update goal set name = '%@', description = '%@', point = %d, feedback = %d, enable = %d where id = %d",[self name],[self description],[self point],[self feedback],[self enable],[self ID]];
    
    [db open];
    
    BOOL result = [db executeUpdate:querySQL];
    
    if(result)
        NSLog(@"update");
    else
        NSLog(@"Error Update");
    
    [db close];
    
    return result;
}

-(BOOL)deleteData
{
    self.description = NULL;
    self.point =0;
    self.feedback = 0;
    self.enable = 0;
    return [self updateData];
}


@end
