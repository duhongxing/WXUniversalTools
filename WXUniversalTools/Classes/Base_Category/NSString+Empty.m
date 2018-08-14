//
//  NSString+Empty.m
//  WXUniversalTools
//
//  Created by 杜红星 on 2018/8/14.
//  Copyright © 2018年 MrDu. All rights reserved.
//

#import "NSString+Empty.h"

@implementation NSString (Empty)

- (BOOL)stringIsEmpty {
    
    if (self == nil) {
        return YES;
    }
    
    if (self.length == 0 || [[self stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0) {
        return YES;
    }
    
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([self isEqualToString:@""]) {
        return YES;
    }
    
    if ([self isEqualToString:@"<null>"]) {
        return YES;
    }
    
    if (![self isKindOfClass:[NSString class]]) {
        return YES;
    }
    
    return NO;
}

@end
