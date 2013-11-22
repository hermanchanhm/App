//
//  RatingScale.h
//  App
//
//  Created by Huy Nguyen on 11/18/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBConnection.h"
#import "GoalDetail.h"

@interface RatingScale : NSObject
{
    FMDatabase *db;
    int dayCount;
}

@property (strong, nonatomic) NSMutableArray *arrRating;
@property (strong, nonatomic) NSMutableArray *arrFeedback;;


-(NSMutableArray *)getRating;
-(NSMutableArray *)getFeedback;

-(void)setRating;
-(void)setFeedback;
-(int)getDayCount;
-(void)dayCompleted;
-(void)reloadData;

-(void)resetParameter;
@end
