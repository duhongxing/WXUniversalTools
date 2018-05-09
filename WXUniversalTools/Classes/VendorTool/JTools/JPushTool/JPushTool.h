//
//  JPushTool.h
//  JW_BasePorject
//
//  Created by JW on 2018/5/2.
//  Copyright © 2018年 JW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface JPushTool : NSObject


+ (JPushTool *)shareJPushInstance;


// 在应用启动的时候调用
- (void)jpush_setupWithOption:(NSDictionary *)launchingOption
                 appKey:(NSString *)appKey
                channel:(NSString *)channel
       apsForProduction:(BOOL)isProduction
  advertisingIdentifier:(NSString *)advertisingId;


// 在appdelegate注册设备处调用
- (void)registerDeviceToken:(NSData *)deviceToken;

//设置角标
- (void)setBadge:(int)badge;


//获取注册ID  
- (void)getRegisterIDCallBack:(void(^)(NSString *registerID))completionHandler;

//处理推送信息
- (void)handleRemoteNotification:(NSDictionary *)remoteInfo;

//处理自定义消息
@property(nonatomic,copy) void(^receiveCustomMessage)(NSDictionary *message);


//跳转
@property(nonatomic,copy) void(^handleClickMessage)(NSDictionary *message);



@end
