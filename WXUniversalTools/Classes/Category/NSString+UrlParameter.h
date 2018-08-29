//
//  NSString+UrlParameter.h
//  WXUniversalTools
//
//  Created by 杜红星 on 2018/8/29.
//  Copyright © 2018年 MrDu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (UrlParameter)

/**
 获取url中带的参数并转化为json

 @param urlString eg:https://daojia/User/LogIn/index?username=helili&password=ji2018&gender=0&age=25
 @return json parameter
 */
+ (NSDictionary *)getParameterFromUrlString:(NSString *)urlString;

@end
