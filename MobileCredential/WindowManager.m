//
//  WindowManager.m
//  MobileCredential
//
//  Created by leeyeon2 on 2021/11/24.
//

#import "WindowManager.h"
#import "AppDelegate.h"
@implementation WindowManager

// 현재 보이는 최상위 컨트롤러 얻기
+ (UIViewController *)topVisibleViewController {
//    return [self getTopPresentViewController:[[UIApplication sharedApplication] delegate].window.rootViewController];
    return [self getTopPresentViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
//    return [AppDelegate keyWindow];
}

// 최상위 modal 컨트롤러 얻기
+ (UIViewController *)getTopPresentViewController:(UIViewController *)rootViewController
{
    if(!rootViewController.presentedViewController) {
        return [self getTopPushedViewController:rootViewController];
    }
    UIViewController *presentedViewController = (UIViewController *)rootViewController.presentedViewController;
    return [self getTopPresentViewController:presentedViewController];
}

// navigation 중 최상위 컨트롤러 반환
+ (UIViewController *)getTopPushedViewController:(UIViewController *)rootViewController
{
    if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController;
        UIViewController *lastViewController = [[navigationController viewControllers] lastObject];
        return lastViewController;
    }
    return rootViewController;
}

@end
