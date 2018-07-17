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

//身份证号
- (BOOL)simpleVerifyIdentityCardNum;

@end
