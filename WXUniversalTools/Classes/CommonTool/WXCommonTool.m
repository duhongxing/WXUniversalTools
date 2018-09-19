//
//  WXCommonTool.m
//  WXUniversalTools
//
//  Created by 杜红星 on 2018/9/4.
//  Copyright © 2018年 MrDu. All rights reserved.
//

#import "WXCommonTool.h"

@implementation WXCommonTool

+ (instancetype)shareTool {
    static WXCommonTool * _tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_tool == nil) {
            _tool = [[self alloc]init];
        }
    });
    return _tool;
}

- (UIViewController *)currentViewController {
    
    //始终可以获取到
    UIWindow *keyWindow = [[UIApplication sharedApplication].delegate window];
    //当使用StoryBoard时 会出现问题
//        UIWindow *keyWindow = [[UIApplication sharedApplication]keyWindow];

    UIViewController *vc = keyWindow.rootViewController;
    while (vc.presentedViewController) {
        vc = vc.presentedViewController;
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = [(UINavigationController *)vc visibleViewController];
        } else if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = [(UITabBarController *)vc selectedViewController];
        }
    }
    return vc;
}

- (UIWindow *)lastWindow
{
    NSArray *windows = [UIApplication sharedApplication].windows;
    for(UIWindow *window in [windows reverseObjectEnumerator]) {
        if ([window isKindOfClass:[UIWindow class]] &&
            CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds))
            return window;
    }
    return [UIApplication sharedApplication].keyWindow;
}


- (UIViewController *)getViewControllerWithView:(UIView *)view {
    //通过响应者链，取得此视图所在的视图控制器
    UIResponder *next = view.nextResponder;
    do {
        //判断响应者对象是否是视图控制器类型
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = next.nextResponder;
        
    }while(next != nil);
    
    return nil;
}

@end
