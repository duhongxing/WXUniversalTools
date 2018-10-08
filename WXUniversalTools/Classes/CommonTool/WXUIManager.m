//
//  WXUIManager.m
//  WXUniversalTools
//
//  Created by 杜红星 on 2018/10/8.
//  Copyright © 2018年 MrDu. All rights reserved.
//

#import "WXUIManager.h"

@implementation WXUIManager

+ (instancetype)sharedManager {
    static WXUIManager *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_manager == nil) {
            _manager = [[self alloc]init];
        }
    });
    return _manager;
}

- (UIWindow *)keyWindow {
    return [UIApplication sharedApplication].keyWindow;
}

- (UIEdgeInsets)safeAreaInset {
    if (@available(iOS 11.0, *)) {
        if (self.keyWindow) {
            return self.keyWindow.safeAreaInsets;
        }
    }
    return UIEdgeInsetsZero;
}

- (BOOL)isHairHead {
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return self.safeAreaInset.left > 0.0f;
    }else {
        // iOS12 非刘海屏状态栏 20.0f
        return self.safeAreaInset.top > 20.0f;
    }
}

@end
