//
//  BaseViewController.h
//  Test
//
//  Created by hcui on 13-7-26.
//  Copyright (c) 2013年 kada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController<NSURLConnectionDelegate>
{
    NSURLConnection *urlconnection;
    NSMutableArray *base_array;
    NSMutableData *base_data;
    NSString *base_str;
    BOOL state_refresh;
}
@property(assign,nonatomic) BOOL state_refresh;

@property(retain,nonatomic) NSURLConnection *urlconnection;
@property(retain,nonatomic) NSMutableData *base_data;
@property(retain,nonatomic) NSMutableArray *base_array;
@property(retain,nonatomic) NSString *base_str;

-(void)Base_UrlConnection:(NSString *)url;
@end
