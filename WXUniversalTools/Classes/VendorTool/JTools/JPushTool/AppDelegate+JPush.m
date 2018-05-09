//
//  AppDelegate+JPush.m
//  JW_BasePorject
//
//  Created by JW on 2018/5/2.
//  Copyright © 2018年 JW. All rights reserved.
//

#import "AppDelegate+JPush.h"
#import "JPushConst.h"
#import "JPushTool.h"
@implementation AppDelegate (JPush)

- (void)JPushApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    [[JPushTool shareJPushInstance] jpush_setupWithOption:launchOptions appKey:JPushAppKey channel:JPushChannel apsForProduction:isProduction advertisingIdentifier:nil];
    
    [[JPushTool shareJPushInstance] getRegisterIDCallBack:^(NSString *registerID) {
        //获取注册id
        NSLog(@"%@",registerID);
        
    }];
    
    [[JPushTool shareJPushInstance] setReceiveCustomMessage:^(NSDictionary *message) {
        //自定义消息
        NSLog(@"%@",message);
    }];
    
    [[JPushTool shareJPushInstance] setHandleClickMessage:^(NSDictionary *message) {
        //处理推送跳转
        NSLog(@"%@",message);
        
        if(application.applicationState == UIApplicationStateActive){
            
            //APP正在运行时，推送过来消息的处理
            
        }else if(application.applicationState == UIApplicationStateInactive) {
            
            //APP在后台运行，推送过来消息的处理
            
            
        }else if(application.applicationState == UIApplicationStateBackground) {
            
            //APP没有运行，推送过来消息的处理
            
        }
        

    }];
    
    
    [[JPushTool shareJPushInstance] setBadge:0];
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // Required - 注册 DeviceToken
    [[JPushTool shareJPushInstance] registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    // Required, iOS 7 Support   iOS7及以上系统，收到通知
    [[JPushTool shareJPushInstance] handleRemoteNotification:userInfo];
    
    completionHandler(UIBackgroundFetchResultNewData);
    
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    // iOS6及以下系统，收到通知:
    // Required,For systems with less than or equal to iOS6
    [[JPushTool shareJPushInstance] handleRemoteNotification:userInfo];
    
//    [[JPushTool shareJPushInstance]getUserDic:userInfo];

    
}

@end
