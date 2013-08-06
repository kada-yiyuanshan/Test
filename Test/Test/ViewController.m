//
//  ViewController.m
//  Test
//
//  Created by hcui on 13-7-25.
//  Copyright (c) 2013年 kada. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "SBJson.h"
#import "ListCell.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize indictorview;
@synthesize refresh;
@synthesize tableview;
@synthesize toastview;
@synthesize m_time,s_time;
@synthesize s_min;
@synthesize other_send,anther_send;
- (void)viewDidLoad
{
    [super viewDidLoad];
//    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
	self.indictorview.hidden=YES;
    self.state_refresh=NO;
    m_time=@"0";
    s_time=@"0";
    [self.indictorview setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
   // NSString *str=@"https://open.t.qq.com/api/user/other_info?format=json&name=ddjsbk&fopenid=&oauth_consumer_key=801357018&access_token=0363aa59466c1178f9f33a9694479d4f&openid=40063D7340DDAC88BBE6B1788E0FF40C&clientip=122.193.29.102&oauth_version=2.a&scope=all";   //[self Base_UrlConnection:str];
   // [self testStr:nil];
//    NSNumber *numObj = [NSNumber numberWithInt: 2];
//    
//    NSLog(@"numObj=%@",numObj);
//    
//    NSInteger myInteger = [numObj integerValue];
//
   //NSLog(@"string=%@",self.base_str);
    self.toastview=[[UIView alloc] initWithFrame:CGRectMake(50,50,50,50)];
    self.toastview.backgroundColor=[UIColor redColor];
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 1.0; //seconds
    lpgr.delegate = self;
    [self.tableview addGestureRecognizer:lpgr];
    [lpgr release];
    self.other_send =[[NSMutableArray alloc] init];
    self.anther_send =[[NSMutableArray alloc] init];
}
-(IBAction)sendAction:(id)sender
{
    static NSInteger number=0;
    if (number%2==0) {
        [self.other_send addObject:message_me.text];
    }else
    {
        [self.anther_send addObject:message_me.text];
    }
    number=number+1;
    [self.tableview reloadData];
}
-(void)state:(BOOL)sta
{
    state_refresh=sta;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"mm"];
    NSString *mintime = [formatter stringFromDate:[NSDate date]];
    [formatter setDateFormat:@"ss"];
    NSString *sectime = [formatter stringFromDate:[NSDate date]];
    int a=[mintime intValue]*60+[sectime intValue];
    
    int c=a-self.s_min;
    if (!state_refresh) {
        
    }else{
    if (c>3) {
        [self refresh:nil];
    }
    
    }
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"mm"];
    NSString *mintime = [formatter stringFromDate:[NSDate date]];
    [formatter setDateFormat:@"ss"];
    NSString *sectime = [formatter stringFromDate:[NSDate date]];
    int b=[mintime intValue]*60+[sectime intValue];
    self.s_min=b;
}
- (void) showMessageWithTitle: (NSString *) title message: (NSString *) message
    {
        UIAlertView *messageView = [[[UIAlertView alloc] initWithTitle: title
                                                               message: message
                                                              delegate: self
                                                     cancelButtonTitle: NSLocalizedString(@"OK", @"")
                                                     otherButtonTitles: @"cancel",nil] autorelease];
        [messageView show];
        
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

    if (buttonIndex==1) {
        [self refresh:nil];
    }
}
-(IBAction)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        
        CGPoint p = [gestureRecognizer locationInView:self.tableview];
        
        NSIndexPath *indexPath = [self.tableview indexPathForRowAtPoint:p];
        if (indexPath == nil) {
            NSLog(@"long press on table view but not on a row");
        } else {
            UITableViewCell *cell = [self.tableview cellForRowAtIndexPath:indexPath];
            if (cell.isHighlighted) {
//                NSLog(@"long press on table view at section %d row %d", indexPath.section, indexPath.row);
                [self showMessageWithTitle:@"long press" message:@"ok"];
                [self.view addSubview:toastview];
            }
        }
    }
}

-(NSString *)testStr:(NSString *)str
{

    return str;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.other_send count]+[self.anther_send count];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString  *TableSampleIdentifier=@"TableSampleIdentifier";
    
    ListCell *cell=(ListCell *)[tableView
                              dequeueReusableCellWithIdentifier: TableSampleIdentifier];
    
    if(cell==nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ListCell"
                                                     owner:self options:nil];
        for (id oneObject in nib)
            if ([oneObject isKindOfClass:[ListCell class]])
                cell = (ListCell *)oneObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSInteger numb=[indexPath section];
    if (numb%2==0) {
        cell.image.frame=CGRectMake(20,0,90,cell.frame.size.height);
        cell.lable.frame=CGRectMake(34,0,90,cell.frame.size.height);
        cell.lable.text=[self.other_send objectAtIndex:numb%2];
        [cell.image setImage:[UIImage imageNamed:@"box_blue.png" ]];
    }else
    {
         cell.image.frame=CGRectMake(184,0,90,cell.frame.size.height);
        cell.lable.frame=CGRectMake(190,0,90,cell.frame.size.height);
        cell.lable.text=[self.anther_send objectAtIndex:numb%2-1];
        [cell.image setImage:[UIImage imageNamed:@"box_green.png" ]];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    
    if (cell.accessoryType==UITableViewCellAccessoryCheckmark) {
        cell.accessoryType=UITableViewCellAccessoryNone;
    }
    else {
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
    }

    SecondViewController *second=[[SecondViewController alloc] init];
    second.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    second.index=[indexPath section];
    second.delegate=self;
    [self presentViewController:second animated:YES completion:nil];
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
        cell.backgroundColor = [UIColor clearColor];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(IBAction)go:(id)sender
{
    [message_me resignFirstResponder];
    self.indictorview.hidden=YES;
    [self.refresh setImage:[UIImage imageNamed:@"icon_refresh.png"] forState:UIButtonTypeCustom];
    [self.indictorview stopAnimating];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

}
-(IBAction)refresh:(id)sender
{
    self.indictorview.hidden=NO;
    self.indictorview.center=self.refresh.center;
    [self.refresh setImage:[UIImage imageNamed:@"top_button_disable.png"] forState:UIButtonTypeCustom];
    [self.indictorview startAnimating];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

}
@end
