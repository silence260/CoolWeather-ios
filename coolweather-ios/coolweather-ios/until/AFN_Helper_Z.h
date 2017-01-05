//
//  AFN_Helper_Z.h
//  coolweather-ios
//
//  Created by silence on 17/1/5.
//  Copyright © 2017年 silence. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface AFN_Helper_Z : NSObject

+ (void)getJSONWithUrl:(NSString *)urlStr parameters:(id)parameters success:(void (^)(id responseObject))success fail:(void (^)(id responseObject))fail;
+ (void)getJSONWithUrl1:(NSString *)urlStr parameters:(id)parameters success:(void (^)(id responseObject))success fail:(void (^)(id responseObject))fail;

@end
