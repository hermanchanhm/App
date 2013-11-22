//
//  Widget.m
//  App
//
//  Created by Huy Nguyen on 11/17/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import "Widget.h"

@implementation Widget

-(id)init{
    self = [super init];
    if(self) {
        db = [[[DBConnection alloc]init] connectDB] ;
        widgetName = [self loadWidget];
    }
    
    return self;
}

-(NSString *)getWidget{
    return widgetName;
}


-(NSString *)loadWidget{
    NSString *strWidget=nil;
    
    NSString *querySQL = @"select * from parameter where name = 'widget'";
    
    [db open];
    
    FMResultSet *resultSet = [db executeQuery:querySQL];
    
    if([resultSet next])    {
        strWidget = [resultSet stringForColumn:@"value"];
    }
    
    return strWidget;
}

-(void)setWidget:(NSString *)newWidget{
    NSString *querySQL = [NSString stringWithFormat:@"update parameter set Value = '%@' where Name = 'widget'", newWidget];
    
    [db open];
    
    BOOL result = [db executeUpdate:querySQL];
    
    if(result)  NSLog(@"Update Widget fail.");
    else NSLog(@"Update widget successfully");
    
    [db close];
    widgetName = newWidget;
}

@end