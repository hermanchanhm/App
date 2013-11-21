//
//  SetGoalView.m
//  App
//
//  Created by Huy Nguyen on 11/18/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import "SetGoalView.h"

@interface SetGoalView ()

@end

@implementation SetGoalView

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

-(void)viewWillAppear:(BOOL)animated
{
    [self prepareData];
    [self.tableView reloadData];
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
    cell.detailTextLabel.text= goal.description;
    
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    
    NSLog(@"index %d", (int)row);
    
    if( self.goalDetailView == nil)
    {
        self.goalDetailView = [self.storyboard instantiateViewControllerWithIdentifier:@"goalDetailView"];
    }
    
    self.goalDetailView.objGoal = [arrayOfGoals objectAtIndex:row];
    Goal *g = [arrayOfGoals objectAtIndex:row];
    NSLog(@"Goal item: %@, %@, %d",g.name, g.description, g.point);
    
    [self.navigationController pushViewController:self.goalDetailView animated:YES];
    
    [[self goalDetailView] loadData];
    
}












@end
