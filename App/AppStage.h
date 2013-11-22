//
//  AppStage.h
//  App
//
//  Created by Huy Nguyen on 11/22/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBConnection.h"

@interface AppStage : NSObject
{
    FMDatabase * db ;
    int currentStage ;
}

-(bool)setStage:(int)newStage;
-(int)getStage;


@end
