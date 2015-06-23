//
//  ViewController.m
//  判断当前网络状态
//
//  Created by Ss on 15/6/10.
//  Copyright (c) 2015年 Kevin. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
@interface ViewController ()<NSURLConnectionDataDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self checkNewtworkStatus];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -私有方法
#pragma mark -网络状态变化提示

- (void)alert:(NSString*)message
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"当前网络状态" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alertView show];
}

#pragma mark -网络状态检测
- (void)checkNewtworkStatus
{
    NSURL *url = [NSURL URLWithString:@"http://www.wiwide.com"];
    AFHTTPRequestOperationManager *operationManager = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:url];
    
    [operationManager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
                [self alert:@"2G/3G/4G Connection."];
                break;
           case AFNetworkReachabilityStatusReachableViaWiFi:
                [self alert:@"WiFi Connection."];
            
                break;
            case AFNetworkReachabilityStatusNotReachable:
                [self alert:@"Network not found."];
                break;
            default:
                break;
        }
    }];
    
    [operationManager.reachabilityManager startMonitoring];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
