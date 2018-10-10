//
//  NSString+FilterString.m
//  WXUniversalTools
//
//  Created by 杜红星 on 2018/10/10.
//  Copyright © 2018年 MrDu. All rights reserved.
//

#import "NSString+FilterString.h"

@implementation NSString (FilterString)

+ (NSString *)filterCharacterForString:(NSString *)string {
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"。：；、，【】～^_「」？》《——……^·,.:;¥?![]{}#%^*£€•$><~|/？！@{}（#-%*+=）\\|~(＜＞$%^&*)+｛｝"];
    NSLog(@"过滤前:%@",string);
    string = [string stringByTrimmingCharactersInSet:set];
    NSLog(@"过滤后:%@",string);
    return string;
}

@end
