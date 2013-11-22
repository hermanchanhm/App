//
//  SettingsTableViewController.m
//  App
//
//  Created by Herman on 11/16/13.
//  Copyright (c) 2013 Team 22. All rights reserved.
//

#import "SettingsTableViewController.h"
#import "SettingsTableViewCell.h"

@interface SettingsTableViewController ()

@end

@implementation SettingsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.settingsArray = [[NSArray alloc] initWithObjects:@"Diet",@"Exercise",@"Bad Habit",@"4",@"5", nil];
    self.settingsArray = @[@"View Goals", @"Notification Time", @"Widgets", @"Reset and Erase All Data"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.settingsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"settingsCell";
    SettingsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    long row = [indexPath row];
    cell.settingsLabel.text = self.settingsArray[row];
    
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0)
    {
        //push to view selected on 1st row
        UIViewController *anotherVC = [self.storyboard instantiateViewControllerWithIdentifier:@"goalVC"];
        [self.navigationController pushViewController:anotherVC animated:YES];
        
    }
    if(indexPath.row==1)
    {
        //push to view selected on 2st row
        UIViewController *anotherVC = [self.storyboard instantiateViewControllerWithIdentifier:@"notificationVC"];
        [self.navigationController pushViewController:anotherVC animated:YES];
    }
    if(indexPath.row==2)
    {
        //push to view selected on 3rd row
        UIViewController *anotherVC = [self.storyboard instantiateViewControllerWithIdentifier:@"widgetVC"];
        [self.navigationController pushViewController:anotherVC animated:YES];
        
    }
    /*
    if(indexPath.row==3)
    {
        //push to view selected on 4th row
        UIViewController *anotherVC = [self.storyboard instantiateViewControllerWithIdentifier:@"setprofileVC"];
        [self.navigationController pushViewController:anotherVC animated:YES];
    }
     */
    if(indexPath.row==3)
    {
        //Trigger UIActionSheet to confirm user selection
        
        UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                      initWithTitle:@"Are You Sure? This cannot be undone."
                                      delegate:self
                                      cancelButtonTitle:@"Cancel"
                                      destructiveButtonTitle:@"Reset and Erase All Data"
                                      otherButtonTitles:nil];
        [actionSheet showInView:self.view];
        
        //UIViewController *anotherVC = [self.storyboard instantiateViewControllerWithIdentifier:@"resetVC"];
        //[self.navigationController pushViewController:anotherVC animated:YES];
    }
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    NSString *buttonClicked = [actionSheet buttonTitleAtIndex:buttonIndex];
    if  ([buttonClicked isEqualToString:@"Reset and Erase All Data"])
    {
       GoalDetail * objGoalDetail = [[GoalDetail alloc]init];
  
        Goal * objGoal = [[Goal alloc]init];
        for(int i =1; i <= 5; i++)
        {
            [objGoalDetail removeGoalDetail:i];
            [objGoal deleteData:i];
        }
        
        RatingScale * objRatingScale = [[RatingScale alloc]init];
        [objRatingScale resetParameter];
        
        [objRatingScale dayCompleted];
        
        AppStage * objStage = [[AppStage alloc]init];
        [objStage setStage:0];
        
        //Trigger UIAlertView
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Reset Complete"
                                                          message:@"All data has been erased. Please restart the App in order for the reset to take effect."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];

        
        

    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
