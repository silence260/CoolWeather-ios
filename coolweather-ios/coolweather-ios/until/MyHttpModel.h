//
//  MyHttpModel.h
//  coolweather-ios
//
//  Created by silence on 17/1/5.
//  Copyright © 2017年 silence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface MyHttpModel : NSObject
+ (AFHTTPSessionManager *)sharedMyManager;
@end
