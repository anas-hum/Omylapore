//
//  AppDelegate.m
//  Omylapore
//
//  Created by humworld on 20/11/14.
//  Copyright (c) 2014 humworld. All rights reserved.
//

#import "AppDelegate.h"
#import "Header.h"
#import "UIImage+ImageEffects.h"

@interface AppDelegate ()
{
    UIImageView *logoView,*longView,*oMylaporView,*companyView;
    UIView *deviceView,*cloudView;
    UILabel *descLable;

}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window.backgroundColor = [UIColor redColor];
    
    [self.window makeKeyAndVisible];
   
    [self setupAppearance];
    [self animationView];
    
    return YES;
}

- (void)setupAppearance
{
    UILabel *headerLabelAppearance = [UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil];
    [headerLabelAppearance setBackgroundColor:[UIColor clearColor]];
    
    UITableViewCell *tableViewCellAppearance = [UITableViewCell appearanceWhenContainedIn:[UITableView class], nil];
    [tableViewCellAppearance setBackgroundColor:[UIColor clearColor]];
    
    UIView *contentViewAppearance = [UIView appearanceWhenContainedIn:[UITableViewCell class], nil];
    [contentViewAppearance setBackgroundColor:[UIColor clearColor]];
    
    [[UITableView appearance] setBackgroundColor:[UIColor clearColor]];
    //    [[UITableView appearance] setBackgroundView:[[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"Baby.png"] applyLightEffect]]];
//    [[UITableView appearance] setBackgroundView:[[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"galaxy.png"] applyLightEffect]]];
    
    [[UINavigationBar appearance] setBackgroundColor:[UIColor clearColor]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}


-(void)animationView
{
    
    deviceView = [UIView new];
    deviceView.frame = self.window.bounds;
    [self.window addSubview:deviceView];
    [self.window bringSubviewToFront:deviceView];
    
    longView = [UIImageView new];
    longView.image = [UIImage imageNamed:@"splash_banner.jpg"];
    [deviceView addSubview:longView];
    
    
    descLable = [UILabel new];
    descLable.text = @" Copyright (c) 2014 humworld. All rights reserved.";
    descLable.textAlignment = UITextAlignmentCenter;
    [descLable setFont:[UIFont systemFontOfSize:12.0f]];
    descLable.numberOfLines = 2;
    descLable.adjustsFontSizeToFitWidth = YES;
    [deviceView addSubview:descLable];
    
    
    if(IS_IPHONE6)
    {
        longView.frame = CGRectMake(0, 0, 375, 200);
        descLable.frame = CGRectMake(0, 617, 375, 50);
        cloudView.frame = CGRectMake(0, longView.frame.origin.y+longView.frame.size.height-2, 375, 667-longView.frame.size.height);
        [deviceView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"375 x 667.jpg"]]];
        
    }
    else if (IS_IPHONE6PLUS)
    {
        longView.frame = CGRectMake(0, 0, 414, 220);
        descLable.frame = CGRectMake(0, 686, 414, 50);
        [deviceView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"splash_screen_plus_bg.jpg"]]];
        
        
        
    }
    else if (IS_IPHONE5)
    {
        longView.frame = CGRectMake(0, 0, 320, 160);
        descLable.frame = CGRectMake(0, 518, 320, 50);
        [deviceView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"320 x 568.jpg"]]];
        
        
        
    }
    else if (IS_IPHONE4)
    {
        longView.frame = CGRectMake(0, 0, 320, 130);
        descLable.frame = CGRectMake(0, 430, 320, 50);
        [deviceView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"320 x 480.jpg"]]];
        
    }
    else
    {
        longView.frame = CGRectMake(0, 0, 768, 300);
        descLable.frame  = CGRectMake(0, 974, 768, 50);
        [deviceView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"splash_screen iPad_bg.jpg"]]];
        
    }
    
    
    logoView = [UIImageView new];
    logoView.frame = CGRectMake(0, 0, 100, 100);
    [logoView setCenter:CGPointMake(deviceView.bounds.size.width/2, deviceView.bounds.size.height/2)];
    logoView.image = [UIImage imageNamed:@"logo.png"];
    [deviceView addSubview:logoView];
    
    companyView = [UIImageView new];
    companyView.frame = CGRectMake(logoView.frame.origin.x, logoView.frame.origin.y + logoView.frame.size.height + 5, 100, 20);
    companyView.image = [UIImage imageNamed:@"company_name.png"];
    [deviceView addSubview:companyView];
    
    oMylaporView = [UIImageView new];
    oMylaporView.image = [UIImage imageNamed:@"app_name.png"];
    [deviceView addSubview:oMylaporView];
    oMylaporView.frame = CGRectMake(logoView.frame.origin.x-40, logoView.frame.origin.y
                                    + 70,170, 200);
    oMylaporView.hidden = YES;
    
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.delegate = self;
    rotationAnimation.fromValue = [NSNumber numberWithFloat:4.0f];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 * 0.20 * 5.0 ];
    rotationAnimation.duration = 2.0;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 1.0;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    
    [logoView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
}

- (void) animationDidStart:(CAAnimation *)theAnimation {
    
    // your logic goes here …
}

- (void) animationDidStop:(CAAnimation *)theAnimation
                 finished:(BOOL)flag {
    // your logic goes here …
    
    oMylaporView.hidden = NO;
    
    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
        oMylaporView.frame = CGRectMake(logoView.frame.origin.x-40, logoView.frame.origin.y
                                        + logoView.frame.size.height + 30,170, 50);
        
    }
                     completion:^(BOOL finished) {
                         
                         
                         [self->deviceView removeFromSuperview];
                         
                         UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                         
                         UIViewController *initViewController = [storyboard instantiateViewControllerWithIdentifier:@"HomeView"];
                         self.window.rootViewController = initViewController;
                         
                         
                     }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
