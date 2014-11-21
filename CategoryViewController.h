//
//  CategoryViewController.h
//  Omylapore
//
//  Created by humworld on 20/11/14.
//  Copyright (c) 2014 humworld. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageTableCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView *iv;
@property (nonatomic, strong) IBOutlet UILabel *nameLable;

@end

@interface CategoryViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
