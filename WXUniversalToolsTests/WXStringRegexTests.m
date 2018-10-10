//
//  WXStringRegexTests.m
//  WXUniversalToolsTests
//
//  Created by 杜红星 on 2018/10/10.
//  Copyright © 2018年 MrDu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+FilterString.h"

@interface WXStringRegexTests : XCTestCase

@end

@implementation WXStringRegexTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *string = @"£€•$1334中国";
    string = [NSString filterCharacterForString:string];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
