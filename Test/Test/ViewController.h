//
//  ViewController.h
//  Test
//
//  Created by hcui on 13-7-25.
//  Copyright (c) 2013年 kada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@protocol stateDelegate <NSObject>

-(void)state:(BOOL)sta;

@end

@interface ViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate,UIAlertViewDelegate,stateDelegate,UITextFieldDelegate>
{
    UITableView *tableview;
    UIActivityIndicatorView *indictorview;
    UIButton *refresh;
    UIView *toastview;
    NSString *m_time;
    NSString *s_time;
    int s_min;
    
    NSMutableArray *other_send;
    NSMutableArray *anther_send;
    IBOutlet UITextField *message_me;
}

@property(retain,nonatomic) NSMutableArray *other_send;
@property(retain,nonatomic) NSMutableArray *anther_send;
@property(assign,nonatomic) int s_min;
@property(retain,nonatomic) NSString *m_time;
@property(retain,nonatomic) NSString *s_time;
@property(retain,nonatomic) IBOutlet UITableView *tableview;
@property(retain,nonatomic) IBOutlet UIActivityIndicatorView *indictorview;
@property(retain,nonatomic) IBOutlet UIButton *refresh;
@property(retain,nonatomic) UIView *toastview;
-(IBAction)go:(id)sender;
-(IBAction)refresh:(id)sender;
-(NSString *)testStr:(NSString *)str;
-(IBAction)sendAction:(id)sender;
@end
