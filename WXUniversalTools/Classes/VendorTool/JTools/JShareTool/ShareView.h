//
//  ShareView.h
//  JShareDemo
//
//  Created by ys on 11/01/2017.
//  Copyright © 2017 ys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSHAREService.h"

typedef void(^ShareBlock)(JSHAREPlatform platform, JSHAREMediaType type);

@interface ShareView : UIView

+ (ShareView *)getFactoryShareViewWithCallBack:(ShareBlock)block;

/**
 设置分享类型及平台

 @param type 分享类型
 @param platforms 平台数组
 */
- (void)showWithContentType:(JSHAREMediaType)type supportPlatform:(NSArray *)platforms;


@end
