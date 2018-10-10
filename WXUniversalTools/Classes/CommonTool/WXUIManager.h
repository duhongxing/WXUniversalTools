//
//  WXUIManager.h
//  WXUniversalTools
//
//  Created by 杜红星 on 2018/10/8.
//  Copyright © 2018年 MrDu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WXUIManager : NSObject

@property (nonatomic, readonly, assign) UIEdgeInsets safeAreaInset;//!< 安全区域

/**
 是否是带刘海的屏幕
 */
@property (nonatomic, readonly, assign) BOOL isHairHead;

+ (instancetype)sharedManager;

@end
