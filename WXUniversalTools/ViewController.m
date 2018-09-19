//
//  ViewController.m
//  WXUniversalTools
//
//  Created by 杜红星 on 2018/5/8.
//  Copyright © 2018年 MrDu. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Empty.h"
#import "NSString+UrlParameter.h"
#import "WXCommonTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *string = nil;
    NSLog(@"%@",nil);
    NSLog(@"%@",[NSNull class]);

    BOOL ret = [NSString isEmptyWithString:string];
    if (ret) {
        NSLog(@"字符串为空");
    } else {
         NSLog(@"字符串不为空");
    }
    
    NSLog(@"%@",[[WXCommonTool shareTool]currentViewController]);
    
   
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}





@end
