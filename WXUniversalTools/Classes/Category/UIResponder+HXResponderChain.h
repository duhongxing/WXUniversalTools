//
//  UIResponder+HXResponderChain.h
//  WXUniversalTools
//
//  Created by 杜红星 on 2018/10/9.
//  Copyright © 2018年 MrDu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (HXResponderChain)

- (void)routerEventWithEventName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end
