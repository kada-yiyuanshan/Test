//
//  SecondViewController.m
//  Test
//
//  Created by hcui on 13-7-25.
//  Copyright (c) 2013年 kada. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize keyBoardMargin_;
@synthesize next,previous;
@synthesize array,index;
@synthesize delegate;
@synthesize imageview;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self = [super initWithNibName:@"SecondViewController" bundle:nibBundleOrNil];
    } else {
        self = [super initWithNibName:@"SecondViewController~iPad" bundle:nibBundleOrNil];
    }
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   // self.array=[[NSMutableArray alloc] init];
    field1.text=[self.array objectAtIndex:self.index];
    self.imageview.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back:)];
    
    [self.imageview addGestureRecognizer:singleTap];
}
-(IBAction)back:(id)sender
{
    [self.delegate state:YES];
    [self dismissModalViewControllerAnimated:YES];
}
-(IBAction)nextAction:(id)sender
{
    if (self.index<0) {
        self.index=-1;
    }
    self.index+=1;
    if (self.index>[self.array count]-1) {
        self.next.selected=YES;
    }else{
    field1.text=[self.array objectAtIndex:self.index];
    }
 NSLog(@"next_index====>%d",index);
}

-(IBAction)previousAction:(id)sender
{
    NSLog(@"self.array count====>%d",[self.array count]);
    if(self.index>[self.array count]-1)
    {
        self.index=4;
    }
    NSLog(@"previous_index====>%d",index);
        self.index-=1;
        
    if (self.index<0) {
        self.previous.selected=YES;
    }else{
    field1.text=[self.array objectAtIndex:self.index];
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self moveView:textField leaveView:NO];
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self moveView:textField leaveView:YES];
}

#pragma make  keyboard

- (void)moveView:(UITextField *)textField leaveView:(BOOL)leave
{
    float screenHeight = 480; //screen size
    float keyboardHeight = 216; //keyboard size
    float statusBarHeight,NavBarHeight,tableCellHeight,textFieldFromButtomHeigth;
    int margin;
    statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    NavBarHeight = self.navigationController.navigationBar.frame.size.height;
    
    //UITableViewCell *tableViewCell=(UITableViewCell *)textField.superview;
    tableCellHeight = textField.frame.origin.y+2*textField.frame.size.height;
    

    textFieldFromButtomHeigth = screenHeight - statusBarHeight - NavBarHeight - tableCellHeight;
    NSLog(@"height=====>%f",textFieldFromButtomHeigth);
    if(!leave) {
        if(textFieldFromButtomHeigth < keyboardHeight) {
            margin = keyboardHeight - textFieldFromButtomHeigth;
            keyBoardMargin_ = margin;
        } else {
            margin= 0;
            keyBoardMargin_ = 0;
        }
    }
    const float movementDuration = 0.4f;
    
    int movement = (leave ? keyBoardMargin_ : -margin);
    
    [UIView beginAnimations: @"textFieldAnim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

@end
