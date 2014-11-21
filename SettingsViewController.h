//
//  SettingsViewController.h
//  Omylapore
//
//  Created by humworld on 21/11/14.
//  Copyright (c) 2014 humworld. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideButton;
- (IBAction)doneAction:(id)sender;
@property (nonatomic) BOOL viaHome;
@end
