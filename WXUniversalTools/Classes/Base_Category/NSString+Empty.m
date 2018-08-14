//
//  NSString+Empty.m
//  WXUniversalTools
//
//  Created by 杜红星 on 2018/8/14.
//  Copyright © 2018年 MrDu. All rights reserved.
//

#import "NSString+Empty.h"

@implementation NSString (Empty)

+ (BOOL)isEmptyWithString:(NSString *)string {
    
    if (string == nil) {
        return YES;
    }
    
    if (string.length == 0 || [[string stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([string isEqualToString:@""]) {
        return YES;
    }
    
    if ([string isEqualToString:@"<null>"]) {
        return YES;
    }
    
    if ([string isEqualToString:@"null"]) {
        return YES;
    }
    
    if (![string isKindOfClass:[NSString class]]) {
        return YES;
    }
    
    return NO;
}

@end
