//
//  PresentedViewController.m
//  CustomizeTransitionManager
//
//  Created by ALittleNasty on 2017/3/22.
//  Copyright © 2017年 ALittleNasty. All rights reserved.
//

#import "PresentedViewController.h"

@interface PresentedViewController ()

@end

@implementation PresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor greenColor];
}

#pragma mark - Action 

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
