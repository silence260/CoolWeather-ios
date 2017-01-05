//
//  MyHttpModel.m
//  coolweather-ios
//
//  Created by silence on 17/1/5.
//  Copyright © 2017年 silence. All rights reserved.
//
#import "MyHttpModel.h"

@implementation MyHttpModel

static AFHTTPSessionManager *manager;

+ (AFHTTPSessionManager *)sharedMyManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 初始化请求管理类
        manager = [AFHTTPSessionManager manager];
    });
    return manager;
    
}

@end
