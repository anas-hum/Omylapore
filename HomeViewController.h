//
//  HomeViewController.h
//  Omylapore
//
//  Created by humworld on 20/11/14.
//  Copyright (c) 2014 humworld. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideButton;
@property (weak, nonatomic) IBOutlet UICollectionView *gridView;

@end
