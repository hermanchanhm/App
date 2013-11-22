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
    
    NSString * home = NSHomeDirectory();
    NSString *str = [NSString stringWithFormat:@"%@/Documents", home];
    databaseName = @"appDB.sqlite";
    dbPathString = [str stringByAppendingPathComponent:databaseName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL success;
    success = [fileManager fileExistsAtPath:dbPathString];
   
    if(!success)
    {
    // Showing App Document path
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    
    // Set Destination file path
    NSString *fileInDocumentsPath = [documentsPath stringByAppendingPathComponent:@"appDB.sqlite"];
    
    // Set Origin file path
    NSString *fileInBundlePath = [[NSBundle mainBundle] pathForResource:@"appDB" ofType:@"sqlite"];
    
    // File manager for copying
    NSError *error = nil;
    [fileManager copyItemAtPath:fileInBundlePath toPath:fileInDocumentsPath error:&error];
    }
    
    
    
    //NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory,NSUserDomainMask,YES);
    //NSString *docPath =[path objectAtIndex:0];
    
    //dbPathString = [docPath stringByAppendingPathComponent:databaseName];
    //NSString * str = NSHomeDirectory();
    //dbPathString = [str stringByAppendingPathComponent:databaseName];
    ///-------
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath =[path objectAtIndex:0];
    dbPathString = [docPath stringByAppendingPathComponent:databaseName];
    
    
    
    [self createAndCheckDatabase];
    
    return [FMDatabase databaseWithPath:dbPathString];
}

-(void)createAndCheckDatabase
{
    /*
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    success = [fileManager fileExistsAtPath:dbPathString];
    if(success) return;
    NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingString:databaseName];
    [fileManager copyItemAtPath:databasePathFromApp toPath:dbPathString error:nil];
    */
    
    //--dbPathString = [[NSBundle mainBundle] pathForResource:@"appDB" ofType:@"sqlite"];
    
   // First, test for existence.
   BOOL success;
   NSFileManager *fileManager = [NSFileManager defaultManager];
   NSError *error;
   NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
   NSString *documentsDirectory = [paths objectAtIndex:0];
   NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:databaseName];
   success = [fileManager fileExistsAtPath:writableDBPath];
   if (success) return;
   // The writable database does not exist, so copy the default to the appropriate location.
   NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];
   success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
   if (!success) {
        NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
   }
   
    
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
