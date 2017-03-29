//
//  NaviRootViewController.m
//  CustomizeTransitionManager
//
//  Created by ALittleNasty on 2017/3/22.
//  Copyright © 2017年 ALittleNasty. All rights reserved.
//

#import "NaviRootViewController.h"
#import "PushedViewController.h"

@interface NaviRootViewController ()

@end

@implementation NaviRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor magentaColor];
    self.navigationItem.title = @"Root";
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"Push" forState:UIControlStateNormal];
    button.translatesAutoresizingMaskIntoConstraints=NO;
    [button setBackgroundColor:[UIColor brownColor]];
    [button addTarget:self action:@selector(pushAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    NSArray *constraintsH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[button]-20-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)];
    
    NSArray *constraintsV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-200-[button(==40)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)];
    
    [self.view addConstraints:constraintsH];
    [self.view addConstraints:constraintsV];
}

#pragma mark - Action

- (void)pushAction
{
    PushedViewController *pushedVC = [[PushedViewController alloc] init];
    [self.navigationController pushViewController:pushedVC animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
