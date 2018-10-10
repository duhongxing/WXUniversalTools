//
//  UIResponder+HXResponderChain.m
//  WXUniversalTools
//
//  Created by 杜红星 on 2018/10/9.
//  Copyright © 2018年 MrDu. All rights reserved.
//

#import "UIResponder+HXResponderChain.h"

@implementation UIResponder (HXResponderChain)

- (void)routerEventWithEventName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    [[self nextResponder]routerEventWithEventName:eventName userInfo:userInfo];
}

@end
