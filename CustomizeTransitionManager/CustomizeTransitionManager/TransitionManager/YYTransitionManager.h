//
//  YYTransitionManager.h
//  CustomizeTransitionManager
//
//  Created by ALittleNasty on 2017/3/21.
//  Copyright © 2017年 ALittleNasty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "YYTransiton.h"

@interface YYTransitionManager : NSObject<UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate>

@property (nonatomic, assign) YYTransitionModalType type;
@property (nonatomic, strong) id<UIViewControllerContextTransitioning> delegate;


@end
