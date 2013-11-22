//
//  Widget.h
//  App
//
//  Created by Huy Nguyen on 11/17/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DBConnection.h"

@interface Widget : NSObject
{
    FMDatabase *db;
    NSString *widgetName;
}


-(NSString *)getWidget;
-(void)setWidget:(NSString *)newWidget;


@end
