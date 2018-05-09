//
//  JPushTool.m
//  JW_BasePorject
//
//  Created by JW on 2018/5/2.
//  Copyright © 2018年 JW. All rights reserved.
//

#import "JPushTool.h"
#import "JPUSHService.h"
// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

@interface JPushTool()<JPUSHRegisterDelegate>


@end

@implementation JPushTool

+ (JPushTool *)shareJPushInstance{
    
    static JPushTool * pushTool = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pushTool = [[JPushTool alloc] init];
    });
    
    return pushTool;
}

- (void)jpush_setupWithOption:(NSDictionary *)launchingOption appKey:(NSString *)appKey channel:(NSString *)channel apsForProduction:(BOOL)isProduction advertisingIdentifier:(NSString *)advertisingId{
    
    //极光推送
    //Required
    
    //notice: 3.0.0及以后版本注册可以这样写，也可以继续用之前的注册方式
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        // 可以添加自定义categories
        // NSSet<UNNotificationCategory *> *categories for iOS10 or later
        // NSSet<UIUserNotificationCategory *> *categories for iOS8 and iOS9
        
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
            NSSet<UNNotificationCategory *> *categories;
            entity.categories = categories;
        }
        else {
            
            NSSet<UIUserNotificationCategory *> *categories;
            entity.categories = categories;
        }
    }
    
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];

    //崩溃统计
    [JPUSHService crashLogON];
    //    Required
    //     init Push(2.1.5版本的SDK新增的注册方法，改成可上报IDFA，如果没有使用IDFA直接传nil  )
    //     如需继续使用pushConfig.plist文件声明appKey等配置内容，请依旧使用[JPUSHService setupWithOption:launchOptions]方式初始化。
    [JPUSHService setupWithOption:launchingOption appKey:appKey
                          channel:channel
                 apsForProduction:isProduction
            advertisingIdentifier:nil];
    
    //自定义消息监听
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter addObserver:self selector:@selector(networkDidReceiveMessage:) name:kJPFNetworkDidReceiveMessageNotification object:nil];
    
}

//自定义消息处理
- (void)networkDidReceiveMessage:(NSNotification *)notification {
    NSDictionary * userInfo = [notification userInfo];
    
    NSString *content = [userInfo valueForKey:@"content"];
    NSLog(@"自定义消息-content:%@",content);
    NSString *messageID = [userInfo valueForKey:@"_j_msgid"];
    NSDictionary *extras = [userInfo valueForKey:@"extras"];
    NSString *customizeField1 = [extras valueForKey:@"customizeField1"]; //服务端传递的Extras附加字段，key是自己定义的
    if (self.receiveCustomMessage) {
        self.receiveCustomMessage(userInfo);

    }
    
}




- (void)registerDeviceToken:(NSData *)deviceToken {
    [JPUSHService registerDeviceToken:deviceToken];
}

- (void)setBadge:(int)badge{
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:badge];
    [JPUSHService setBadge:badge];////重置JPush服务器上面的badge值。如果下次服务端推送badge传"+1",则会在你当时JPush服务器上该设备的badge值的基础上＋1；
}

- (void)getRegisterIDCallBack:(void (^)(NSString *))completionHandler{
    [JPUSHService registrationIDCompletionHandler:^(int resCode, NSString *registrationID) {
        if (resCode == 0) {
            NSLog(@"registrationID获取成功：%@",registrationID);
            completionHandler(registrationID);
        }
    }];
}

- (void)handleRemoteNotification:(NSDictionary *)userInfo{
    [JPUSHService handleRemoteNotification:userInfo];
    
    if (self.handleClickMessage) {
        self.handleClickMessage(userInfo);
    }
    
}


#pragma mark- JPUSHRegisterDelegate

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [self handleRemoteNotification:userInfo];
    }
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以选择设置
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [self handleRemoteNotification:userInfo];
    }
    completionHandler(UNNotificationPresentationOptionAlert);  // 系统要求执行这个方法
    
//    [self getUserDic:userInfo];

}




#pragma mark - 废弃
- (void)getUserDic:(NSDictionary *)userDic{
    
    UIViewController *vc = [self topVC:[UIApplication sharedApplication].keyWindow.rootViewController]; //拿到当前页面的VC
    
    
}

- (UIViewController *)topVC:(UIViewController *)rootViewController{
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tab = (UITabBarController *)rootViewController;
        return [self topVC:tab.selectedViewController];
    }else if ([rootViewController isKindOfClass:[UINavigationController class]]){
        UINavigationController *navc = (UINavigationController *)rootViewController;
        return [self topVC:navc.visibleViewController];
    }else if (rootViewController.presentedViewController){
        UIViewController *pre = (UIViewController *)rootViewController.presentedViewController;
        return [self topVC:pre];
    }else{
        return rootViewController;
    }
    
}

@end
