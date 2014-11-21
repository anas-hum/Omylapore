//
//  SettingsViewController.m
//  Omylapore
//
//  Created by humworld on 21/11/14.
//  Copyright (c) 2014 humworld. All rights reserved.
//

#import "SettingsViewController.h"
#import "SWRevealViewController.h"
#import "UIImage+ImageEffects.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize viaHome;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    // Set the gesture
    if(!viaHome)
    {
        _sideButton.target = self.revealViewController;
        _sideButton.action = @selector(revealToggle:);

      [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
        self.navigationItem.rightBarButtonItem = nil;
    }
    else
    {
        self.navigationItem.leftBarButtonItem = nil;
    }
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[[UIImage imageNamed:@"galaxy.png"] applyLightEffect]];
    
//    self.view.backgroundColor = [UIColor whiteColor];

    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    if(indexPath.row == 0)
    {
        cell.textLabel.text = @"Notification";
        
        UISwitch *mySwitch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
        
        [mySwitch addTarget:self action:@selector(changeAcSwitch:) forControlEvents:UIControlEventValueChanged];
        
        cell.accessoryView = mySwitch;
    }
    else if (indexPath.row == 1)
    {
        cell.textLabel.text = @"Synchronization";
        
        UISwitch *mySwitch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
        
        [mySwitch addTarget:self action:@selector(changeAcSwitch:) forControlEvents:UIControlEventValueChanged];
        
        cell.accessoryView = mySwitch;

    }
    else if (indexPath.row == 2)
    {
        cell.textLabel.text = @"Enable Cache";
        
        UISwitch *mySwitch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
        
        [mySwitch addTarget:self action:@selector(changeAcSwitch:) forControlEvents:UIControlEventValueChanged];
        
        cell.accessoryView = mySwitch;
        
    }

    
    return cell;
}

- (void)changeAcSwitch:(id)sender{
    if([sender isOn]){
        // Execute any code when the switch is ON
        NSLog(@"Switch is ON");
    } else{
        // Execute any code when the switch is OFF
        NSLog(@"Switch is OFF");
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)doneAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
