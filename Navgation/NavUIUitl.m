//
//  NavUIUitl.m
//  Panda
//
//  Created by Panda on 2017/8/10.
//  Copyright © 2017年 Panda. All rights reserved.
//

#import "NavUIUitl.h"

@implementation NavUIUitl

+ (UIViewController *)currentViewController
{
    UIViewController* rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [self findCurrentVC:rootViewController];
}

+ (UIViewController*)findCurrentVC:(UIViewController*)rootViewController
{
    UIViewController* currentViewController = nil;
    if ([rootViewController presentedViewController])
    {
        currentViewController = [self findCurrentVC:[rootViewController presentedViewController]];
    }
    else if ([rootViewController isKindOfClass:[UINavigationController class]])
    {
        currentViewController = [self findCurrentVC:[(UINavigationController*)rootViewController visibleViewController]];
    }
    else if ([rootViewController isKindOfClass:[UITabBarController class]])
    {
        currentViewController = [self findCurrentVC:[(UITabBarController*)rootViewController selectedViewController]];
    }
    else
    {
        currentViewController = rootViewController;
    }
    return currentViewController;
}
@end
