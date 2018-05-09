//
//  JShareTool.h
//  JW_BasePorject
//
//  Created by JW on 2018/5/2.
//  Copyright © 2018年 JW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ShareView.h"// 极光在此类中有引入

@interface JShareTool : NSObject

/**
 初始化并配置分享  建议在 application:didFinishLaunchingWithOptions: 中调用
 */
+ (void)setupJShareConfig;

/**
 分享

 @param view 分享视图父视图
 @param message 分享信息
 */
+ (void)shareViewAddSuperview:(UIView *)view withMessage:(JSHAREMessage *)message;




@end
