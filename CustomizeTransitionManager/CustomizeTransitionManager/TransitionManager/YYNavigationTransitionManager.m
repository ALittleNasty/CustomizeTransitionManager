//
//  YYNavigationTransitionManager.m
//  CustomizeTransitionManager
//
//  Created by ALittleNasty on 2017/3/21.
//  Copyright © 2017年 ALittleNasty. All rights reserved.
//

#import "YYNavigationTransitionManager.h"

@implementation YYNavigationTransitionManager

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return YYTransitonDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [[transitionContext containerView] addSubview:toVC.view];
    toVC.view.alpha = 0.0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
       
        fromVC.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
        toVC.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        fromVC.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
