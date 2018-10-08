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
    
    UILabel *textLab = [[UILabel alloc]initWithFrame:CGRectMake(50, 300, self.view.bounds.size.width - 100, 100)];
    textLab.numberOfLines = 0;
    textLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:textLab];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing       = 19;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:@"性别、生日信息已经编辑保存后，将不支持修改哦，小主请确保信息提交无误后再提交~" attributes:@{NSParagraphStyleAttributeName:paragraphStyle}];
    textLab.attributedText = attributedString;
    textLab.layer.borderWidth = 1;
    textLab.layer.borderColor = [[UIColor redColor]CGColor];
    
   
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}





@end
