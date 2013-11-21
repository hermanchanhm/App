//
//  DBConnection.h
//  testApp
//
//  Created by Huy Nguyen on 11/17/13.
//  Copyright (c) 2013 Huy Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMResultSet.h"

@interface DBConnection: NSObject
{
    NSString *dbPathString;
    NSString *databaseName;
     
}

-(FMDatabase *)connectDB;

//-(NSMutableArray *)getResult:(NSString *)sqlString;

@end
