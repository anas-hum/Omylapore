//
//  HomeViewController.m
//  Omylapore
//
//  Created by humworld on 20/11/14.
//  Copyright (c) 2014 humworld. All rights reserved.
//

#import "HomeViewController.h"
#import "SWRevealViewController.h"
#import "UIImage+ImageEffects.h"
#import "Header.h"
#import "SettingsViewController.h"

@interface HomeViewController ()

@property (nonatomic, strong)NSArray *menuItems;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sideButton.target = self.revealViewController;
    _sideButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[[UIImage imageNamed:@"galaxy.png"] applyLightEffect]];
    
    _menuItems = @[@"Events",@"Free Ads", @"Train", @"City Guide"];
    
    _gridView.backgroundColor = [UIColor clearColor];
    _gridView.delegate = self;
    _gridView.dataSource = self;
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[[UIImage imageNamed:@"galaxy1.jpeg"] applyLightEffect]];

    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _menuItems.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        return CGSizeMake(200.f, 200.f);
    }
    
    return CGSizeMake(150.f, 150.f);
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"GridCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    if(cell == nil)
    {
        cell = [UICollectionViewCell new];
    }
    
    UIView *selectView = [UIView new];
    selectView.backgroundColor = [UIColor lightGrayColor];
    
    cell.selectedBackgroundView= selectView;
    
    CALayer *imageLayer1 = cell.selectedBackgroundView.layer;
    [imageLayer1 setCornerRadius:75.0];
    [imageLayer1 setBorderWidth:1];
    [imageLayer1 setMasksToBounds:YES];

    UIImageView *thumbImage = (UIImageView *)[cell viewWithTag:100];
    UILabel *nameLable = (UILabel *)[cell viewWithTag:150];
    UIView *thumbView = (UIView *)[cell viewWithTag:80];
    
    thumbView.backgroundColor = [UIColor clearColor];
    thumbImage.image = [UIImage imageNamed:@"apple_logo.png"];

    if(indexPath.row == 0)
        thumbImage.image = [UIImage imageNamed:@"event.png"];
    else if (indexPath.row == 1)
        thumbImage.image = [UIImage imageNamed:@"ad-free_ico.png"];
    else if (indexPath.row == 2)
        thumbImage.image = [UIImage imageNamed:@"train_icon.png"];
    else if (indexPath.row == 3)
        thumbImage.image = [UIImage imageNamed:@"City.png"];


    
    CALayer *imageLayer = thumbView.layer;
    [imageLayer setCornerRadius:75.0];
    [imageLayer setBorderWidth:1];
    [imageLayer setMasksToBounds:YES];
    
    nameLable.text = [_menuItems objectAtIndex:indexPath.row];

    

    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

/*-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *datasetCell =[collectionView cellForItemAtIndexPath:indexPath];
    datasetCell.backgroundColor = [UIColor clearColor]; // Default color
}*/

#pragma mark collection view cell paddings
- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    if(IS_IPHONE4)
        return UIEdgeInsetsMake(40, 5, 5, 5);
    else if(IS_IPHONE5)
        return UIEdgeInsetsMake(80, 5, 5, 5);
    else if(IS_IPHONE6)
        return UIEdgeInsetsMake(120, 5, 5, 5);
    else if(IS_IPHONE6PLUS)
        return UIEdgeInsetsMake(140, 5, 5, 5);
    else
        return UIEdgeInsetsMake(10, 5, 5, 5);
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 5.0;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"viaHome"])
    {
        UINavigationController *nav = [segue destinationViewController];
        SettingsViewController *settingsVc = (SettingsViewController *)nav.topViewController;
        settingsVc.viaHome = YES;
    }
    
 }



@end
