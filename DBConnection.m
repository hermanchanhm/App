//
//  DBConnection.m
//  testApp
//
//  Created by Huy Nguyen on 11/17/13.
//  Copyright (c) 2013 Huy Nguyen. All rights reserved.
//

#import "DBConnection.h"


@implementation DBConnection

/*
-(id)init
{
    self = [super init];
    if(self)
    {
        //Initialization code
        databaseName = @"appDB.db";
        [self connectDB];
    }
    
    return self;
}
*/

-(FMDatabase *)connectDB
{
    databaseName = @"appDB.sqlite";
    
    //NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory,NSUserDomainMask,YES);
    //NSString *docPath =[path objectAtIndex:0];
    
    //dbPathString = [docPath stringByAppendingPathComponent:databaseName];
    NSString * str = NSHomeDirectory();
    dbPathString = [str stringByAppendingPathComponent:databaseName];
    
    //[self createAndCheckDatabase];
    
    return [FMDatabase databaseWithPath:dbPathString];
}

-(void)createAndCheckDatabase
{
    BOOL success;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    success = [fileManager fileExistsAtPath:dbPathString];
    
    if(success) return;
    
    NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingString:databaseName];
   
    
    [fileManager copyItemAtPath:databasePathFromApp toPath:dbPathString error:nil];
}

/*
-(NSMutableArray *)getResult:(NSString *)sqlString
{
    [arrayOfItems removeAllObjects];
    
    [db open];
    
    FMResultSet *resultSet = [db executeQuery:sqlString];
    
    while([resultSet next])
    {
        [arrayOfItems addObject:[resultSet resultDictionary]];
    }
    
    [db close];
    
    return arrayOfItems;
}
*/
@end
