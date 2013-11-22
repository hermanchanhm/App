//
//  GoalListView.m
//  App
//
//  Created by Huy Nguyen on 11/18/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import "GoalListView.h"

@interface GoalListView ()

@end

@implementation GoalListView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    arrayOfGoals = [[NSMutableArray alloc]init];
    [[self tableView]setDelegate:self];
    [[self tableView]setDataSource:self];
    [self prepareData];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayOfGoals count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier =@"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    Goal *goal = [arrayOfGoals objectAtIndex:indexPath.row];
    
    cell.textLabel.text = goal.name;
    //cell.detailTextLabel.text= goal.description;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %d times/%@", goal.description, goal.numFrequency, goal.frequencyName];
    
    
    return cell;
}

-(void)prepareData
{
    [arrayOfGoals removeAllObjects];
    
    for(int i =1; i<=5; i++)
    {
        Goal * _goal = [[Goal alloc]initWithGoalID:i];
        [arrayOfGoals addObject:_goal];
    }
}
@end
