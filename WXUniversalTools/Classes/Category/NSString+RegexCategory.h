//
//  NSString+RegexCategory.h
//  GoodTrain
//
//  Created by 杜红星 on 2018/7/17.
//  Copyright © 2018年 MrDu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RegexCategory)

//手机号有效性
- (BOOL)isMobileNumber;

//邮箱
- (BOOL)isEmailAddress;

//判断是否是纯汉字
- (BOOL)isChinese;

//包含文字
- (BOOL)includeChinese;

//仅为数字或字母
- (BOOL)isNumberOrLetter;

/// 仅允许输入中文字，英文字母大小写，数字，符号输入（除了单引号和双引号、回车、换行）
- (BOOL)isValidateText;

//身份证号
- (BOOL)simpleVerifyIdentityCardNum;

//文字在length长度之内之内
- (BOOL)isValidateNameWithLength:(NSInteger)length;

//文字在300之内
- (BOOL)isValidateName;

@end
