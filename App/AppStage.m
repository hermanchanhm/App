//
//  AppStage.m
//  App
//
//  Created by Huy Nguyen on 11/22/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import "AppStage.h"

@implementation AppStage

-(id)init
{
    self = [super init];
    if(self)
    {
        db = [[[DBConnection alloc]init] connectDB] ;
        currentStage = [self getStage];
    }
    return self;
}

-(bool)setStage:(int)newStage
{
    NSString *querySQL = [NSString stringWithFormat:@"update parameter set Value = %d where name = 'Stage'",newStage ];
    
    [db open];
    
    BOOL result = [db executeUpdate:querySQL];
    
    
    if(result)
        currentStage = newStage;
    else
        NSLog(@"Error Update");
    
    [db close];
    
    return result;

}

-(int)getStage
{
    NSString *querySQL = @"select * from parameter where name = 'Stage'";
    
    [db open];
    
    FMResultSet *resultSet = [db executeQuery:querySQL];
    
    if([resultSet next])
    {
        currentStage = [resultSet intForColumn:@"Value"];
    }
    
    [db close];
    
    return currentStage;
}




@end
