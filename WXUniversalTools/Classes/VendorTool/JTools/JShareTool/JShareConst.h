//
//  JShareConst.h
//  JW_BasePorject
//
//  Created by JW on 2018/5/2.
//  Copyright © 2018年 JW. All rights reserved.
//

#ifndef JShareConst_h
#define JShareConst_h

/* 极光推送 */
static NSString * const JShareAppKey                = @"";

/* 极光分享 - 微信 QQ   */
static NSString * const JShareWXAppID               = @"";
static NSString * const JShareWXAppSecret           = @"";

static NSString * const JShareQQAppID               = @"";
static NSString * const JShareQQAppKey              = @"";



/**
 处理平台回调,必要！
 
 @param url 回调的url，在 Appdelegate 的 application:handleOpenURL: 中调用。不调用此接口 JSHARE 将无法提供分享回调。
 @return 处理结果 YES为处理成功，NO为不处理。
 */
//+ (BOOL)handleOpenUrl:(NSURL *)url;


/**
 获取社交平台用户信息-第三方登录
 
 @param platform 社交平台参数，JSHAREPlatformWechatSession表示微信平台，JSHAREPlatformQQ表示 QQ 平台，JSHAREPlatformSinaWeibo，表示新浪微博平台。
 @param handler 获取社交平台用户信息的回调
 */
//+ (void)getSocialUserInfo:(JSHAREPlatform)platform handler:(JSHARESocialHandler)handler;


#endif /* JShareConst_h */
