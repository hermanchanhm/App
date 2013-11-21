//
//  Goal.h
//  testApp
//
//  Created by Huy Nguyen on 11/17/13.
//  Copyright (c) 2013 Huy Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBConnection.h"

@interface Goal : NSObject
{
    FMDatabase *db;
}

@property (nonatomic)int ID;
@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)NSString *description;
@property (nonatomic)int point;
@property (nonatomic)int feedback;
@property (nonatomic)int enable;

-(id)initWithGoalID:(int)goalID;

-(void)loadData:(int)goalID;

-(BOOL)updateData;

-(BOOL)deleteData;

@end
