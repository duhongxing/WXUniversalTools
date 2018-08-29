//
//  NSString+UrlParameter.m
//  WXUniversalTools
//
//  Created by 杜红星 on 2018/8/29.
//  Copyright © 2018年 MrDu. All rights reserved.
//

#import "NSString+UrlParameter.h"

@implementation NSString (UrlParameter)

+ (NSDictionary *)getParameterFromUrlString:(NSString *)urlString {
    
    //无效输入
    if (urlString.length == 0 || urlString == nil || [urlString isKindOfClass:[NSNull class]]) {
        NSLog(@"urlString无效数据");
        return nil;
    }
    //参数
    NSString *paramsString;
    
    //url 包含中文 进行转义
    if ([self isIncludeChinese:urlString]) {
        NSString *tempUrl   = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL    *url       = [NSURL URLWithString:tempUrl];
        paramsString = [url.query stringByRemovingPercentEncoding];
    } else {
        NSURL    *url       = [NSURL URLWithString:urlString];
        paramsString = url.query;
    }
    
    NSMutableDictionary *paramsDictionary = [[NSMutableDictionary alloc]init];
    for (NSString *paramString in [paramsString componentsSeparatedByString:@"&"]) {
        NSLog(@"paramsString:\n%@",paramString);
        NSArray *keyValueArray = [paramString componentsSeparatedByString:@"="];
        NSString *key   = [keyValueArray firstObject];
        NSString *value = @"";
        if (keyValueArray.count > 1) {
            value = [keyValueArray lastObject];
        }
        [paramsDictionary setValue:value forKey:key];
    }
    return [paramsDictionary copy];
}

//包含中文
+ (BOOL)isIncludeChinese:(NSString *)text {
    for (int i = 0; i < text.length; i++) {
        int c = [text characterAtIndex:i];
        if (c >= 0x4e00 && c <= 0x9fff) {
            return YES;
        }
    }
    return NO;
}

@end
