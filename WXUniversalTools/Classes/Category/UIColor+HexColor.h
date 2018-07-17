//
//  UIColor+HexColor.h
//  WXUniversalTools
//
//  Created by 杜红星 on 2018/7/17.
//  Copyright © 2018年 MrDu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)

/**
 根据16进制数值获取颜色 eg:0xffffff

 @param hexValue 16进制颜色数值
 @param alphaValue 透明度
 @return 颜色
 */
+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
    
/**
 根据16进制数值获取颜色 eg:0xffffff

 @param hexValue 16进制颜色数值
 @return 颜色
 */
+ (UIColor *) colorWithHex:(NSInteger)hexValue;

/**
 color转为16进制

 @param color 颜色
 @return 颜色的16进制表示
 */
+ (NSString *) hexFromUIColor: (UIColor*) color;
    
    
///颜色转换:iOS (以#开头) 十六进制的颜色转换为UIColor(RGB)
+ (UIColor *)colorWithHexString:(NSString *)color;


    
@end
