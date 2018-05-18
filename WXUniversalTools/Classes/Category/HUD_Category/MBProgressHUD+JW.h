//
//  MBProgressHUD+JW_HUD.h
//  JW_BasePorject
//
//  Created by JW on 2018/5/15.
//  Copyright © 2018年 JW. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (JW)

#pragma mark - 单纯文字提示功能

/**
 单纯文字提示，无图，默认 1.5秒消失 显示在window上

 @param tip 提示文本
 @return MBProgressHUD
 */
+ (MBProgressHUD *)showTip:(NSString *)tip;


/**
 添加自定义时间-同 + (void)showTip:(NSString *)tip;

 @param tip 提示文本
 @param delay 延迟消失时间
 @return MBProgressHUD
 */
+ (MBProgressHUD *)showTip:(NSString *)tip hideDelay:(NSTimeInterval)delay;



#pragma mark - 三种常用带图提示

/**
 成功提示带图  1.5s

 @param message 提示文本
 @return MBProgressHUD
 */
+ (MBProgressHUD *)showSuccessMessage:(NSString *)message;


/**
 错误提示带图  1.5s

 @param message 提示文本
 @return MBProgressHUD
 */
+ (MBProgressHUD *)showErrorMessage:(NSString *)message;


/**
 ⚠️警告信息提示  1.5s

 @param message 提示文本
 @return MBProgressHUD
 */
+ (MBProgressHUD *)showWarnMessage:(NSString *)message;



#pragma mark - 指示器加文字

/**
 活动菊花指示 无图无字 手动控制消失

 @return MBProgressHUD
 */
+ (MBProgressHUD *)showActivityIndicator;


/**
 带文字活动提示

 @param message 提示文本
 @return MBProgressHUD
 */
+ (MBProgressHUD *)showActivityMessage:(NSString *)message;


/**
 隐藏HUD
 */
+ (void)hideHUD;

@end
