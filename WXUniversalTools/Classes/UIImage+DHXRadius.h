//
//  UIImage+DHXRadius.h
//  DHXInterviewTest
//
//  Created by 杜红星 on 2018/5/1.
//  Copyright © 2018年 MrDu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DHXRadius)

/**
 图片变圆角

 @param radius 圆角参数
 @return 圆角图片
 */
- (UIImage *)dhx_imageWithCornerRadius:(CGFloat)radius;

@end
