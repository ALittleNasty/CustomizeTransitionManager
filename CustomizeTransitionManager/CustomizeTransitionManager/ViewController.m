//
//  ViewController.m
//  CustomizeTransitionManager
//
//  Created by ALittleNasty on 2017/3/21.
//  Copyright © 2017年 ALittleNasty. All rights reserved.
//

#import "ViewController.h"
#import "NaviRootViewController.h"
#import "PresentedViewController.h"
#import "YYTransitionManager.h"

@interface ViewController ()

@property (nonatomic, strong) YYTransitionManager *modalManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#pragma mark - Action

- (IBAction)navigationTransitionAction
{
    NaviRootViewController *rootVC = [[NaviRootViewController alloc] init];
    UINavigationController *naviVC = [[UINavigationController alloc] initWithRootViewController:rootVC];
    [self presentViewController:naviVC animated:YES completion:NULL];
}

- (IBAction)modalTransitionAction
{
    PresentedViewController *presentedVC = [[PresentedViewController alloc] init];
    presentedVC.modalPresentationStyle = UIModalPresentationFullScreen;
    presentedVC.transitioningDelegate = self.modalManager;
    [self presentViewController:presentedVC animated:YES completion:NULL];
}

#pragma mark - Lazy Load

- (YYTransitionManager *)modalManager
{
    if (!_modalManager) {
        
        _modalManager = [[YYTransitionManager alloc] init];
        _modalManager.type = YYTransitionModalTypeDirectionFromRight;
    }
    
    return _modalManager;
}


@end
