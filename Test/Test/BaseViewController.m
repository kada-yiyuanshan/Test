//
//  BaseViewController.m
//  Test
//
//  Created by hcui on 13-7-26.
//  Copyright (c) 2013年 kada. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
@synthesize urlconnection;
@synthesize base_data;
@synthesize base_array;
@synthesize base_str;
@synthesize state_refresh;
-(void)dealloc
{
    [super dealloc];
    [urlconnection release];
    [base_data release];
    [base_array release];
    [base_str release];
}

- (void)viewDidLoad
{
    self.base_array=[[NSMutableArray alloc] init];
    UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0,0,30,32) ];
    btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    [super viewDidLoad];
}
-(void)Base_UrlConnection:(NSString *)url
{
    if (self.urlconnection!=nil) {
        [self.urlconnection release];
    }
    if (self.base_data!=nil) {
        [self.base_data release];
    }
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    self.urlconnection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    self.base_data =[[NSMutableData alloc] init];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}
#pragma make NSURLCONNECTION
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    return [self.base_data appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if ([error code] == kCFURLErrorNotConnectedToInternet)
	{
        NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"No Connection Error"
															 forKey:NSLocalizedDescriptionKey];
        NSError *noConnectionError = [NSError errorWithDomain:NSCocoaErrorDomain
														 code:kCFURLErrorNotConnectedToInternet
													 userInfo:userInfo];
        [self handleError:noConnectionError];
    }
	else
	{
        [self handleError:error];
    }
    self.urlconnection=nil;
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *returnString = [[NSString alloc] initWithData:self.base_data encoding:NSUTF8StringEncoding];
   self.base_str=returnString;
    NSLog(@"%@",self.base_str);
}
- (void)handleError:(NSError *)error
{
    NSString *errorMessage = [error localizedDescription];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"网络连接异常"
														message:errorMessage
													   delegate:nil
											  cancelButtonTitle:@"确定"
											  otherButtonTitles:nil];
    [alertView show];
    [alertView release];
}

//
//-(void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    NSLog(@"5");
//}
//-(void)viewDidDisappear:(BOOL)animated
//{
//    [super viewDidDisappear:animated];
//}
//-(void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//    NSLog(@"4");
//}
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    NSLog(@"2");
//}
//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    NSLog(@"6");
//}
//-(void)viewWillLayoutSubviews
//{
//    [super viewWillLayoutSubviews];
//    NSLog(@"3");
//}

@end
