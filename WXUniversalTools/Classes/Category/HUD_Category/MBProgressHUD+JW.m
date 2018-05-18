//
//  MBProgressHUD+JW_HUD.m
//  JW_BasePorject
//
//  Created by JW on 2018/5/15.
//  Copyright © 2018年 JW. All rights reserved.
//

#import "MBProgressHUD+JW.h"

@implementation MBProgressHUD (JW)
/*
 MBProgressHUDMode --
 MBProgressHUDModeIndeterminate -菊花样式
 MBProgressHUDModeDeterminate - 双层圆形进度条
 MBProgressHUDModeDeterminateHorizontalBar - 水平进度条
 MBProgressHUDModeAnnularDeterminate - 单圈圆形进度条
 MBProgressHUDModeCustomView - 自定义样式
 MBProgressHUDModeText - 文字样式
 
 */

#pragma mark - 单纯文字提示功能无图

+ (MBProgressHUD *)showTip:(NSString *)tip{
    return [self showTip:tip hideDelay:1.5];
}

+ (MBProgressHUD *)showTip:(NSString *)tip hideDelay:(NSTimeInterval)delay{
    
    return [self showTextModeMessage:tip hideDealy:delay];
}

/**
 纯文字提示基础方法

 @param msg 提示文本
 @param delay 延迟时间
 @return MBProgressHUD
 */
+ (MBProgressHUD *)showTextModeMessage:(NSString *)msg hideDealy:(NSTimeInterval)delay{
    MBProgressHUD *textHUD = [self showMessage:msg inWindow:YES];
    textHUD.mode = MBProgressHUDModeText;
    [textHUD hideAnimated:YES afterDelay:delay];
    return textHUD;
}


#pragma mark - 三种常用带图提示

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message{
    
    return [self showImageIcon:@"HUD_JW_success" message:message];
}

+ (MBProgressHUD *)showErrorMessage:(NSString *)message{
    
    return [self showImageIcon:@"HUD_JW_error" message:message];
}

+ (MBProgressHUD *)showWarnMessage:(NSString *)message{
    
    return [self showImageIcon:@"HUD_JW_info" message:message];

}


/**
 带图提示基础方法

 @param iconName 图片名字
 @param msg 提示信息
 @return MBProgressHUD
 */
+ (MBProgressHUD *)showImageIcon:(NSString *)iconName message:(NSString *)msg{
    MBProgressHUD *imageHUD = [self showMessage:msg inWindow:YES];
    imageHUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
    imageHUD.mode = MBProgressHUDModeCustomView;
    [imageHUD hideAnimated:YES afterDelay:1.5];
    return imageHUD;
}

#pragma mark - 指示器加文字
+ (MBProgressHUD *)showActivityIndicator{
    MBProgressHUD *activityHUD = [self showMessage:nil inWindow:NO];
    activityHUD.mode = MBProgressHUDModeIndeterminate;
    return activityHUD;
}


+ (MBProgressHUD *)showActivityMessage:(NSString *)message{
    MBProgressHUD *activityHUD = [self showMessage:message inWindow:NO];
    activityHUD.mode = MBProgressHUDModeIndeterminate;
    return activityHUD;
}


+ (void)hideHUD{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:[self HUD_JW_getCurrentUIVC].view];
    if (hud) {
        [self hideHUDForView:[self HUD_JW_getCurrentUIVC].view animated:YES];
    }
}

#pragma mark - 基础方法
/**
 基础方法

 @param msg 提示信息
 @param isWindow 是否在window上
 @return MBProgressHUD
 */
+ (MBProgressHUD *)showMessage:(NSString *)msg inWindow:(BOOL)isWindow{
    UIView  *view = isWindow? (UIView*)[UIApplication sharedApplication].delegate.window:[self HUD_JW_getCurrentUIVC].view;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = msg?msg:@"";
    hud.label.numberOfLines = 0;
    hud.label.font = [UIFont systemFontOfSize:16];
//    hud.detailsLabel.text = msg?msg:@"";;
//    hud.detailsLabel.font = [UIFont systemFontOfSize:16];

    hud.removeFromSuperViewOnHide = YES;
    hud.bezelView.color = [UIColor colorWithWhite:0 alpha:0.7];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.contentColor = [UIColor whiteColor];
    return hud;
    
}



#pragma mark - 获取当前屏幕显示的viewcontroller

+ (UIViewController *)HUD_JW_getCurrentUIVC
{
    UIViewController  *superVC = [[self class]  HUD_JW_getCurrentWindowVC];
    
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }
    return superVC;
}


+ (UIViewController *)HUD_JW_getCurrentWindowVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tempWindow in windows)
        {
            if (tempWindow.windowLevel == UIWindowLevelNormal)
            {
                window = tempWindow;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
    {
        result = nextResponder;
    }
    else
    {
        result = window.rootViewController;
    }
    return  result;
}

@end
