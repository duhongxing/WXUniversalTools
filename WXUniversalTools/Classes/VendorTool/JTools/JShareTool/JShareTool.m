//
//  JShareTool.m
//  JW_BasePorject
//
//  Created by JW on 2018/5/2.
//  Copyright © 2018年 JW. All rights reserved.
//

#import "JShareTool.h"
//#import "JSHAREService.h"
//#import "ShareView.h"
#import "JShareConst.h"

@interface JShareTool ()

@property (nonatomic, strong) ShareView *shareView;
@property (nonatomic, strong) JSHAREMessage *shareMsg;


@end

@implementation JShareTool



/**
 配置分享参数
 */
+ (void)setupJShareConfig{
    JSHARELaunchConfig *config = [[JSHARELaunchConfig alloc] init];
    
    config.appKey = JShareAppKey;
    
    config.WeChatAppId = JShareWXAppID;
    config.WeChatAppSecret = JShareWXAppSecret;
    
    config.QQAppId = JShareQQAppID;
    config.QQAppKey = JShareQQAppKey;
    
    [JSHAREService setupWithConfig:config];
    [JSHAREService setDebug:YES];
    
}

+ (void)shareViewAddSuperview:(UIView *)view withMessage:(JSHAREMessage *)message{
    JShareTool *shareTool = [[JShareTool alloc] init];
    shareTool.shareMsg = message;
    
    [shareTool.shareView showWithContentType:JSHARELink supportPlatform:@[
                                                                          @(JSHAREPlatformWechatSession),
                                                                          @(JSHAREPlatformWechatTimeLine),
                                                                          @(JSHAREPlatformQQ),
                                                                          @(JSHAREPlatformQzone),
                                                                          ]];
    [view addSubview:shareTool.shareView];
    
}



/**
 分享视图
 
 @return 分享视图
 */
- (ShareView *)shareView{
    if (!_shareView) {
        _shareView = [ShareView getFactoryShareViewWithCallBack:^(JSHAREPlatform platform, JSHAREMediaType type) {
            
            [self shareLinkWithPlatform:platform];
            
        }];
    }
    return _shareView;
}


/**
 分享操作
 
 @param platform 分享平台信息
 */
- (void)shareLinkWithPlatform:(JSHAREPlatform)platform{
    self.shareMsg.platform = platform;
    [JSHAREService share:self.shareMsg handler:^(JSHAREState state, NSError *error) {
        [self showAlertWithState:state error:error];
    }];
    
}


/**
 分享回调
 
 @param state 状态值
 @param error 错误码
 */
- (void)showAlertWithState:(JSHAREState)state error:(NSError *)error{
    
    NSString *string = nil;
    if (state == JSHAREStateFail) {
        string = [NSString stringWithFormat:@"分享失败,error:%@", error.description];
    }else{
        switch (state) {
            case JSHAREStateSuccess:
                string = @"分享成功";
                break;
            case JSHAREStateFail:
                string = @"分享失败";
                break;
            case JSHAREStateCancel:
                string = @"分享取消";
                break;
            case JSHAREStateUnknown:
                string = @"Unknown";
                break;
            default:
                break;
        }
    }
    
    if ([string isEqualToString:@"Unknown"]) {
        return;
    }
    
    UIAlertView *Alert = [[UIAlertView alloc] initWithTitle:nil message:string delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    dispatch_async(dispatch_get_main_queue(), ^{
        [Alert show];
    });
}


@end

