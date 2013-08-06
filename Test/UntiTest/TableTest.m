//
//  TableTest.m
//  Test
//
//  Created by hcui on 13-7-30.
//  Copyright (c) 2013年 kada. All rights reserved.
//

#import "TableTest.h"
#import "ViewController.h"
#import "SecondViewController.h"
#import <GHUnitIOS/GHTestCase.h>
#import "SBJson.h"
@implementation TableTest
{
    ViewController *viewcontrol;
    SecondViewController *second;
}
-(void)setUp
{
    [super setUp];
    viewcontrol =[[ViewController alloc] init];
    second=[[SecondViewController alloc] init];
}
-(void)testconnection
{

    GHAssertTrue([viewcontrol testStr:@"abc"]==@"abc", @"");
    GHAssertEqualStrings([viewcontrol testStr:@"123"], @"123", @"");
}
-(void)testSbjson
{
    GHAssertEqualStrings([viewcontrol testStr:@"a"],@"a",@"");
}
@end
