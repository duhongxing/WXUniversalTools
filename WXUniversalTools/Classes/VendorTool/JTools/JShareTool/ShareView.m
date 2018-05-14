//
//  ShareView.m
//  JShareDemo
//
//  Created by ys on 11/01/2017.
//  Copyright © 2017 ys. All rights reserved.
//

#import "ShareView.h"

@interface ShareView()

@property (nonatomic, assign) JSHAREMediaType type;

@property (nonatomic, strong) NSMutableDictionary * platformData;
@property (nonatomic, strong) NSMutableArray * currentContentSupportPlatform;

@property (nonatomic, strong) UIView * shareView;
@property (nonatomic, strong) UIView * lineView;
@property (nonatomic, strong) UIButton * cancelBtn;

@property (nonatomic, assign) CGFloat JShare_ScreenWidth;
@property (nonatomic, assign) CGFloat JShare_ScreenHeight;
@property (nonatomic, assign) CGFloat space;

@end

#define TopSpace 29
#define MidSpace 36
#define BottomSpace 34

#define ImageSize 58
#define ImageLabelSpace 13
#define ItemFontSize 10
#define CancelItemHeight 61
#define CancelFontSize 13

#define LineColor [UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1.0]
#define FontColor [UIColor colorWithRed:85/255.0 green:85/255.0 blue:85/255.0 alpha:1.0]

#define RemainTag 9999


@implementation ShareView {
    ShareBlock _block;
}

#pragma mark - 初始化

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.JShare_ScreenWidth = [UIScreen mainScreen].bounds.size.width;
        self.JShare_ScreenHeight = [UIScreen mainScreen].bounds.size.height;
        self.space = (self.JShare_ScreenWidth-4*ImageSize)/5;
        self.shareView = [[UIView alloc] init];
        self.currentContentSupportPlatform = [[NSMutableArray alloc] init];
        
        self.platformData = [[NSMutableDictionary alloc] init];
        
    }
    return self;
}

+ (ShareView *)getFactoryShareViewWithCallBack:(ShareBlock)block {
    ShareView * shareView = [[ShareView alloc] init];
    [shareView setShareCallBack:block];
    [shareView setShareView];
    [shareView setFacade];
    [shareView setCancelView];
    return shareView;
}

- (void)setShareCallBack:(ShareBlock)block {
    if (block) {
        _block = nil;
        _block = [block copy];
    }
}

- (void)setShareView {
    //white cover
    self.shareView.backgroundColor = [UIColor whiteColor];
    //gary line
    self.lineView = [[UIView alloc] init];
    self.lineView.backgroundColor = LineColor;
    self.lineView.tag = RemainTag;
    [self.shareView addSubview:self.lineView];
    [self addSubview:self.shareView];
}

- (void)setFacade {
    self.frame = CGRectMake(0, 0, self.JShare_ScreenWidth, self.JShare_ScreenHeight);
    self.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.5];
}


- (void)setCancelView {
    self.cancelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.cancelBtn.tag = RemainTag;
    self.cancelBtn.titleLabel.font = [UIFont systemFontOfSize:CancelFontSize];
    [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelBtn setTitleColor:FontColor forState:UIControlStateNormal];
    [self.cancelBtn addTarget:self action:@selector(hiddenView) forControlEvents:UIControlEventTouchUpInside];
    [self.shareView addSubview:self.cancelBtn];
}





#pragma mark - 设置item 及 试图的frame
- (void)setShareItem {
    //clear history item
    for (UIView * view in self.shareView.subviews) {
        if (view.tag != 9999) {
            [view removeFromSuperview];
        }
    }
    //layout item
    for (int i=0; i<self.currentContentSupportPlatform.count; i++) {
        NSNumber * platformkey = self.currentContentSupportPlatform[i];
        NSInteger row = i/4;
        NSInteger column = i%4;
        UIButton * shareItem = self.platformData[platformkey][@"item"];
        shareItem.frame = CGRectMake((column+1)*self.space+column*ImageSize, TopSpace+row*(ImageSize+MidSpace+ItemFontSize+ImageLabelSpace), ImageSize, ImageSize);
        shareItem.tag = platformkey.integerValue;
        [shareItem addTarget:self action:@selector(shareTypeSelect:) forControlEvents:UIControlEventTouchUpInside];
        [shareItem setImage:[UIImage imageNamed:self.platformData[platformkey][@"image"]] forState:UIControlStateNormal];
        
        UILabel * shareLabel = [[UILabel alloc] init];
        shareLabel.frame = CGRectMake(shareItem.frame.origin.x, CGRectGetMaxY(shareItem.frame)+ImageLabelSpace, CGRectGetWidth(shareItem.frame), ItemFontSize);
        shareLabel.textColor = FontColor;
        shareLabel.font = [UIFont systemFontOfSize:ItemFontSize];
        shareLabel.textAlignment = NSTextAlignmentCenter;
        shareLabel.text = self.platformData[platformkey][@"title"];
        
        [self.shareView addSubview:shareItem];
        [self.shareView addSubview:shareLabel];
    }
    NSInteger totalRow = (self.currentContentSupportPlatform.count-1)/4+1;
    CGFloat shareViewHeight = TopSpace+totalRow*(ImageSize+ItemFontSize+ImageLabelSpace)+(totalRow-1)*MidSpace+BottomSpace+CancelItemHeight;
    self.shareView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, self.JShare_ScreenWidth, shareViewHeight);
    self.cancelBtn.frame = CGRectMake(0, self.shareView.frame.size.height-CancelItemHeight, self.JShare_ScreenWidth, CancelItemHeight);
    self.lineView.frame = CGRectMake(self.space, self.shareView.frame.size.height-62, self.JShare_ScreenWidth-self.space*2, 1);
    [super setHidden:YES];
}





- (void)shareTypeSelect:(UIButton *)sender {
    if (_block) {
        _block(sender.tag, self.type);
    }
    [self hiddenView];
}

- (void)showWithContentType:(JSHAREMediaType)type supportPlatform:(NSArray *)platforms{
    [self setPlatformDataWithLogin:NO];
    self.type = type;
    [self.currentContentSupportPlatform addObjectsFromArray:platforms];
    
    [self setShareItem];
    self.hidden = NO;
}



- (void)setPlatformDataWithLogin:(BOOL)isLogin {
    NSArray * typeArr = @[@(JSHAREPlatformSinaWeibo),
//                                                    @(JSHAREPlatformSinaWeiboContact),//微博私信  -7
                          @(JSHAREPlatformWechatSession),
                          @(JSHAREPlatformWechatTimeLine),
                          @(JSHAREPlatformWechatFavourite),
                          @(JSHAREPlatformQQ),
                          @(JSHAREPlatformQzone),
                          @(JSHAREPlatformFacebook),
                          @(JSHAREPlatformFacebookMessenger),
                          @(JSHAREPlatformTwitter)];
    NSArray * titleArr = nil;
    if(isLogin){
        titleArr = @[@"新浪微博",@"微信",@"微信朋友圈",@"微信收藏",@"QQ",@"QQ空间",@"Facebook",@"Messenger",@"twitter"];
    }else {
        titleArr = @[@"新浪微博",@"微信好友",@"微信朋友圈",@"微信收藏",@"QQ好友",@"QQ空间",@"Facebook",@"Messenger",@"twitter"];
    }
    NSArray * imageArr = @[@"JShare_weibo",@"JShare_wechat",@"JShare_wechat_moment",@"JShare_wechat_fav",@"JShare_qq",@"JShare_qzone",@"JShare_facebook",@"JShare_messenger",@"JShare_twitter"];
    for (int i=0; i<typeArr.count; i++) {
        [self.platformData setObject:@{@"title":titleArr[i], @"image":imageArr[i], @"item":[UIButton buttonWithType:UIButtonTypeCustom]} forKey:typeArr[i]];
    }
    
}


#pragma mark - 显隐操作
- (void)setHidden:(BOOL)hidden {
    if (!hidden) {
        [super setHidden:hidden];
        [UIView animateWithDuration:0.3 animations:^{
            self.shareView.frame = CGRectMake(0, self.JShare_ScreenHeight-CGRectGetHeight(self.shareView.frame), CGRectGetWidth(self.shareView.frame), CGRectGetHeight(self.shareView.frame));
        }];
        [UIView animateWithDuration:0.5 animations:^{
            self.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.5];;
        }];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            self.shareView.frame = CGRectMake(0, self.JShare_ScreenHeight, CGRectGetWidth(self.shareView.frame), CGRectGetHeight(self.shareView.frame));
        }];
        [UIView animateWithDuration:0.5 animations:^{
            self.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.0];;
        } completion:^(BOOL finished) {
            [super setHidden:hidden];
        }];
    }
}

- (void)hiddenView {
    self.type = 0;
    self.hidden = YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self hiddenView];
}

@end
