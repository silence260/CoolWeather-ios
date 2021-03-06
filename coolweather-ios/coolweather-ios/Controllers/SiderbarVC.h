//
//  SiderbarVC.h
//  coolweather-ios
//
//  Created by silence on 17/1/5.
//  Copyright © 2017年 silence. All rights reserved.
//

#import "LLBlurSidebar.h"

@protocol LLBlurSidebarDelegate <NSObject>
@optional
- (void)getTheNumber:(NSString *)numberString;
@end

@interface SiderbarVC : LLBlurSidebar
@property (nonatomic,unsafe_unretained) id<LLBlurSidebarDelegate>delegate;

@end
