//
//  SecondViewController.h
//  Test
//
//  Created by hcui on 13-7-25.
//  Copyright (c) 2013年 kada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "ViewController.h"
@interface SecondViewController : BaseViewController<UITextFieldDelegate>
{
    SecondViewController *viewController;
    IBOutlet UITextField *field1;
    IBOutlet UITextField *field2;
    IBOutlet UITextField *field3;
    IBOutlet UITextField *field4;
    int keyBoardMargin_;
    UIButton *next;
    UIButton *previous;
    NSMutableArray *array;
    NSInteger index;
    id<stateDelegate> delegate;
    UIImageView *imageview;
}
@property(retain,nonatomic) IBOutlet UIImageView *imageview;
@property(assign,nonatomic) id<stateDelegate> delegate;
@property(retain,nonatomic) NSMutableArray *array;
@property(assign,nonatomic) NSInteger index;
@property(retain,nonatomic) IBOutlet UIButton *next;
@property(retain,nonatomic) IBOutlet UIButton *previous;

@property(assign,nonatomic) int keyBoardMargin_;
-(IBAction)back:(id)sender;
-(IBAction)nextAction:(id)sender;
-(IBAction)previousAction:(id)sender;
- (void)moveView:(UITextField *)textField leaveView:(BOOL)leave;
;@end
