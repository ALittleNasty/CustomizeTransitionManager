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

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return YYTransitonDuration;
}

@end
