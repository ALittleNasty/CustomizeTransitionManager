//
//  YYTransitionManager.m
//  CustomizeTransitionManager
//
//  Created by ALittleNasty on 2017/3/21.
//  Copyright © 2017年 ALittleNasty. All rights reserved.
//

#import "YYTransitionManager.h"

@interface YYTransitionManager ()

@end

@implementation YYTransitionManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _type = YYTransitionModalTypeDirectionDefault;
    }
    return self;
}

- (void)setType:(YYTransitionModalType)type
{
    _type = type;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return YYTransitonDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    CGRect startRect;
    
    [containerView addSubview:toViewController.view];
    
    switch (_type) {
        case YYTransitionModalTypeDirectionFromTop: {
            startRect = CGRectMake(0,
                                   -CGRectGetHeight(containerView.frame),
                                   CGRectGetWidth(containerView.bounds),
                                   CGRectGetHeight(containerView.bounds));
        }
            break;
        case YYTransitionModalTypeDirectionFromLeft: {
            startRect = CGRectMake(-CGRectGetWidth(containerView.frame),
                                   0,
                                   CGRectGetWidth(containerView.bounds),
                                   CGRectGetHeight(containerView.bounds));
        }
            break;
        case YYTransitionModalTypeDirectionFromRight: {
            startRect = CGRectMake(CGRectGetWidth(containerView.frame),
                                   0,
                                   CGRectGetWidth(containerView.bounds),
                                   CGRectGetHeight(containerView.bounds));
        }
            break;
            
        default: {
            startRect = CGRectMake(0,
                                   CGRectGetHeight(containerView.frame),
                                   CGRectGetWidth(containerView.bounds),
                                   CGRectGetHeight(containerView.bounds));
        }
            break;
    }
    
    CGPoint transformedPoint = CGPointApplyAffineTransform(startRect.origin, toViewController.view.transform);
    
    toViewController.view.frame = CGRectMake(transformedPoint.x, transformedPoint.y, startRect.size.width, startRect.size.height);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.1
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        
                         fromViewController.view.transform = CGAffineTransformScale(fromViewController.view.transform, 0.9, 0.9);
                         fromViewController.view.alpha = 1.0;
                         fromViewController.view.frame = CGRectMake(0,
                                                                    0,
                                                                    CGRectGetWidth(toViewController.view.frame),
                                                                    CGRectGetHeight(toViewController.view.frame));
    } completion:^(BOOL finished) {
        
        if (toViewController.modalPresentationStyle == UIModalPresentationCustom) {
            [fromViewController endAppearanceTransition];
        }
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
