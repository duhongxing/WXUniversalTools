//
//  UIImage+DHXRadius.m
//  DHXInterviewTest
//
//  Created by 杜红星 on 2018/5/1.
//  Copyright © 2018年 MrDu. All rights reserved.
//

#import "UIImage+DHXRadius.h"

@implementation UIImage (DHXRadius)

- (UIImage *)dhx_imageWithCornerRadius:(CGFloat)radius {
    
    CGRect rect = (CGRect){0.f,0.f,self.size};
    UIGraphicsBeginImageContextWithOptions(self.size, NO,[UIScreen mainScreen].scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(), [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    [self drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
