//
//  ContactViewController.m
//  Omylapore
//
//  Created by humworld on 20/11/14.
//  Copyright (c) 2014 humworld. All rights reserved.
//

#import "ContactViewController.h"
#import "SWRevealViewController.h"
#import "UIImage+ImageEffects.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sideButton.target = self.revealViewController;
    _sideButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[[UIImage imageNamed:@"galaxy.png"] applyLightEffect]];
    
    NSURL *nsurl=[NSURL URLWithString:@"http://www.humworld.com/contact.html"];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [_webView loadRequest:nsrequest];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
